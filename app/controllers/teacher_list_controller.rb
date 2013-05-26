class TeacherListController < ApplicationController
  def index
  	@users = User.where(:user_type => "Teacher")
  end
end
