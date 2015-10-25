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

end