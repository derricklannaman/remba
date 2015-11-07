module ApplicationHelper

  def when_pinned activity
    pin_id = activity['foreign_id'].split(':').last
    pin = Pin.find(pin_id)
    "#{time_ago_in_words pin.created_at} ago"
  end

  def display_item_image item
    attachment_url(item, :item_image, :fill, 300, 300)
  end

end
