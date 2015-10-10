class TeamsController < ApplicationController

  def new
  end


  def add_stylist
    # binding.pry
    # create access code, add stylist_id and current_member.fashionboard.id

    redirect_to fashionboard_path


  end

end