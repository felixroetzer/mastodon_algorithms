class HomeFeed < Feed
  def initialize(account)
    @account = account
    # Replace the default initialization with the public feed
    @feed = PublicFeed.new(nil, local: true)
  end

  def get(limit, max_id = nil, since_id = nil, min_id = nil)
    @feed.get(limit, max_id, since_id, min_id)
  end

  def regenerating?
    false
  end
end
