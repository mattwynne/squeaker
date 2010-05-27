class User < ActiveRecord::Base
  has_many :messages
  
  has_and_belongs_to_many(:followed,
    :class_name => "User",
    :join_table => "followers",
    :foreign_key => 'follower_id',
    :association_foreign_key => "followed_id")
  
  # All messages in the feed
  def feed
    feed = Array.new
    feed.concat messages
    followed.each {|f| feed.concat f.messages}
    return feed.sort {|a,b| a.created_at <=> b.created_at}
  end
end
