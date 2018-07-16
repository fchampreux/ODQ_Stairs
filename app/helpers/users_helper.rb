module UsersHelper

# retrieve the list of responsible users
  def set_responsibles_list
    @responsibles_list = User.all
  end

# retrieve the list of approval users
  def set_approvers_list
    @approvers_list = User.all
  end

# retrieve the list of approval users
  def set_users_list
    @users_list = User.all
  end
  
  # retrieve the list of users groups
  def set_groups_list
    @groups_list = Group.all
  end
  
end
