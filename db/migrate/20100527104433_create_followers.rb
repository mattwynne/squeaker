class CreateFollowers < ActiveRecord::Migration
  def self.up
    create_table "followers", :force => true, :id => false do |t|
      t.integer "follower_id", :null => false
      t.integer "followed_id", :null => false
    end
  end

  def self.down
    drop_table "followers"
  end
end
