# frozen_string_literal: true

class HomeFeed < Feed
  def initialize(account)
    @account = account
    super(:home, account.id)
  end

  def regenerating?
    redis.exists?("account:#{@account.id}:regeneration")
  end

  #  ^|^e Override get to use second-degree feed
  def get(limit, max_id = nil, since_id = nil, min_id = nil)
    limit    = limit.to_i
    max_id   = max_id.to_i if max_id.present?
    since_id = since_id.to_i if since_id.present?
    min_id   = min_id.to_i if min_id.present?

    get_second_degree_feed(limit, max_id, since_id, min_id)
  end

  private

  def get_second_degree_feed(limit, max_id, since_id, min_id)
    # Standard home feed
    home_feed_posts = Status.where(account_id: @account.following_ids + [@account.id])

    # Second-degree connections
    second_degree_ids = @account.following.flat_map(&:following_ids).uniq
    second_degree_posts = Status.where(account_id: second_degree_ids)

    # Combine and sort
    combined_posts = (home_feed_posts + second_degree_posts)
                     .sort_by(&:created_at).reverse

    #  ^|^e Apply ID-based filtering
    combined_posts = combined_posts.select { |post| post.id < max_id } if max_id.present?
    combined_posts = combined_posts.select { |post| post.id > since_id } if since_id.present?
    combined_posts = combined_posts.select { |post| post.id > min_id } if min_id.present?

    combined_posts.take(limit)
  end
end
