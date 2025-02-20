# frozen_string_literal: true

class HomeFeed < Feed
  def initialize(account)
    @account = account
    super(:home, account.id)
  end

  def regenerating?
    redis.exists?("account:#{@account.id}:regeneration")
  end
  def get_second_degree_feed(limit = 10)
      # Standard home feed
    home_feed_posts = Status.where(account_id: @account.following_ids + [@account.id])

      # Second-degree connections
    second_degree_ids = @account.following.flat_map(&:following_ids).uniq
    second_degree_posts = Status.where(account_id: second_degree_ids)

      # Combine both and limit
    (home_feed_posts + second_degree_posts)
      .sort_by(&:created_at).reverse
      .take(limit)
  end

end
