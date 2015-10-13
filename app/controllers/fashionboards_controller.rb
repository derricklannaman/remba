class FashionboardsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @stylists = teams_stylists
    team_stylist_count
  end


  private

    def teams_stylists
      team_access_codes.map(&:stylist_id).map {|id|Stylist.find id }
    end

    def team_stylist_count
      fashion_team.count = stylist_count
      # binding.pry
      fashion_team.save
      @team_count = current_member.team.count
    end

    def stylist_count
      @stylists.size
    end

    def team_access_codes
      fashion_team.access_codes
    end

    def fashion_team
      current_member.team
    end


end
