# frozen_string_literal: true

class Feed
  include Redisable

  def initialize(type, id)
    @type = type
    @id   = id
  end

  def get(limit, max_id = nil, since_id = nil, min_id = nil)
    limit    = limit.to_i
    max_id   = max_id.to_i if max_id.present?
    since_id = since_id.to_i if since_id.present?
    min_id   = min_id.to_i if min_id.present?

    from_redis(limit, max_id, since_id, min_id)
  end

  protected

  def from_redis(limit, max_id, since_id, min_id)
    max_id = '+inf' if max_id.blank?
    if min_id.blank?
      since_id   = '-inf' if since_id.blank?
      unhydrated = redis.zrevrangebyscore(key, "(#{max_id}", "(#{since_id}", limit: [0, limit], with_scores: true).map { |id| id.firs>
    else
      unhydrated = redis.zrangebyscore(key, "(#{min_id}", "(#{max_id}", limit: [0, limit], with_scores: true).map { |id| id.first.to_>
    end

    statuses = Status.where(id: unhydrated)
    statuses = rank_algorithmically(statuses)
    statuses
  end

  def key
    FeedManager.instance.key(@type, @id)
  end

  def rank_algorithmically(statuses)
    decay_rate = 3600 * 24 * 10
    current_time_unix = Time.now.to_i

    statuses.map do |status|
      post_id = status.id
      favourites = status.favourites_count
      created_at_unix = status.created_at.to_i
      time_diff = current_time_unix - created_at_unix

      time_decay_factor = Math.exp(-time_diff.to_f / decay_rate)
      like_factor = Math.sqrt([favourites, 1].max)

      combined_score = like_factor * time_decay_factor

      { status: status, combined_score: combined_score }
    end.sort_by { |post| -post[:combined_score] }.map { |post| post[:status] }
  end
end
