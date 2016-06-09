module ApplicationHelper
  include ProfileImagesHelper

  def time_of_posting activity
    pin_id = activity['foreign_id'].split(':').last
    begin
      pin = Pin.find(pin_id)
      "#{time_ago_in_words pin.created_at} ago"
    rescue
      ""
    end
  end

  def display_item_image item
    attachment_url(item, :item_image, :fill, 300, 300)
  end

  # Current User Name Formatting
  def first_name
    current_user.first_name
  end

  def last_name
    current_user.last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
