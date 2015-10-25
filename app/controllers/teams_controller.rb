class TeamsController < ApplicationController
  include TeamStatus

  def new
  end

  def show
    @team = Team.find(params[:id])
    @style_team = current_user.current_team
    add_to_team_if_team_not_full
  end

  def add_stylist
    team_id = current_member.team.id
    stylist_id = params[:id].to_i

    add_to_team_if_team_not_full team_id, stylist_id
    redirect_to fashionboard_path
  end

  private

    def add_to_team_if_team_not_full
      if current_user.follows.count < 3

      end
    end

end