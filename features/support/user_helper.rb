module UserHelper
  def the_user
    unless username
      raise("There is more than one User!") unless User.count == 1
      User.first
    end
  end
end

World(UserHelper)