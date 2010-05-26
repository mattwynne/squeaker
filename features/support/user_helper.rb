module UserHelper
  def the_user
    raise("There is more than one User!") unless User.count == 1
    User.first
  end
end

World(UserHelper)