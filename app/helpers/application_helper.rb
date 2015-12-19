module ApplicationHelper

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

  def greetings
    current_user.first_name
  end

  def profile_picture
    if current_user.profile_image_id.nil?
      image_tag('default-profile.png', size: "200x200", class: 'default-profile')
    else
      attachment_image_tag(current_user, :profile_image, :fill, 200, 200,
                                  format: "jpg", fallback: "default-profile.png")
    end
  end

  def profile_picture_mini_thumbnail
    link_to attachment_image_tag(current_user, :profile_image, :fill, 40, 40,
                                format: "jpg", fallback: "default-profile.png"),
                                profile_path unless current_user.profile_image_id.nil?
  end

end
