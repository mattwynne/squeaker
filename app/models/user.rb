class User < ActiveRecord::Base
  has_many :messages
  
  def self.unknown
    new(:username => 'stranger')
  end
end
