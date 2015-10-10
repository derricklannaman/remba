class TeamsController < ApplicationController

  def new
  end

  def add_stylist
    team_id = current_member.team.id
    stylist_id = params[:id].to_i
    AccessCode.create(team_id: team_id, stylist_id: stylist_id)

    redirect_to fashionboard_path
  end

end