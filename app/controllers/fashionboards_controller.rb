class FashionboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    team_count

  end


  private

    def team_count
      @team_count = current_member.team.count
    end


end
