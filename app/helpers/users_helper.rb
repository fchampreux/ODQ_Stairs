module UsersHelper

# retrieve the list of responsible users
  def set_responsibles_list
    @responsibles_list = User.all
  end

# retrieve the list of approval users
  def set_approvers_list
    @approvers_list = User.all
  end

end
