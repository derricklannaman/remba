module FashionboardsHelper

  def team_capacity_check
    if @team_count < 3
      content_tag(:div) do
        link_to "add a stylist", stylists_path, class: "btn btn-default"
      end
    else
      content_tag(:h4, 'Current Style Team', class: 'text-muted')
    end
  end

  def roster_spot
    3 - @team_count
  end

  def team_size_dialog
    if roster_spot == 0
      "Your style team has reached maximum capacity."
    else
      "You can add #{roster_spot} stylist."
    end
  end

end