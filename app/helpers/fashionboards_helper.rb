module FashionboardsHelper

  def disable_add_stylist_if_greater_than_3
    # if @team_count < 3
      link_to "Add Stylist", stylists_path, class: "btn btn-warning"
    # else
      # link_to "Add Stylist", stylists_path, class: "btn btn-default disabled"
    # end
  end

end