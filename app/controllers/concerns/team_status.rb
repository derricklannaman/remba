module TeamStatus

  private

  def check_team_limit
    return if number_of_follows == 0
    current_team_count = number_of_follows
    style_team.save!
    if current_team_count < 3
      yield
    else
      flash[:success] = "Maximum number of 3 stylists on a team reached. Please
                        remove a team member."
      redirect_to team_path(fashion_team.id)
    end
  end

  def number_of_follows
    current_user.follows.size
  end

  def current_team_count
    current_user.team.count
  end

  def style_team
    current_user.team
  end

end