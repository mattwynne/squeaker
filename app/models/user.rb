class User < ActiveRecord::Base
  has_many :messages
  
  # Class method to return a null object representing an unknown
  # (i.e. not logged in) User
  def self.unknown
    new(:username => 'stranger')
  end
  
  def follow(other_user)
    # TODO
  end
end
