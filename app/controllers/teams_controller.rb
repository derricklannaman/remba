class TeamsController < ApplicationController

  def new
  end

  def show
    @team = Team.find(params[:id])
    @stylist_on_team = current_user.current_team
  end

  def add_stylist
    team_id = current_member.team.id
    stylist_id = params[:id].to_i

    add_to_team_if_team_not_full team_id, stylist_id
    redirect_to fashionboard_path
  end

  private

    def add_to_team_if_team_not_full team_id, stylist_id
      if current_member.team.count < 3
        AccessCode.create(team_id: team_id, stylist_id: stylist_id)
      end
    end

end