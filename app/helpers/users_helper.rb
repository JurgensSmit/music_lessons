module UsersHelper

  def find_user_by_id(id)
  	user = User.find(id)
  	return user
  end
end