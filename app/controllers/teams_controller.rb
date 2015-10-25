class TeamsController < ApplicationController
  include TeamStatus

  def new
  end

  def show
    @team = Team.find(params[:id])
    @style_team = current_user.current_team
    @team_count = number_of_follows
  end

end