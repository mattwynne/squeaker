class UserSession
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :username
  
  def id
  end

  def persisted?
    false
  end
end

