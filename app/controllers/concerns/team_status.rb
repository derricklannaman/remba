module TeamStatus

  # def team_count
  #   current_user.current_team.count
  # end

  private

  def check_team_limit
    return if current_user.follows.size == 0
    number_of_follows = current_user.follows.size
    current_team_count = current_user.team.count
    current_user.team.count = number_of_follows
    current_user.team.save

    if current_user.team.count < 3
      yield
    else
      redirect_to team_path(fashion_team.id)
    end
  end




end