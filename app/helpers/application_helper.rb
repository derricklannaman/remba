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

  def profile_picture
    if no_profile_image_exist?
      image_tag('default-profile.png', size: "200x200", class: 'default-profile')
    else
      attachment_image_tag(current_user, :profile_image, :fill, 200, 200,
                                  format: "jpg", fallback: "default-profile.png")
    end
  end

  def minisize_thumbnail_current_user
    if no_profile_image_exist?
      link_to image_tag('default-profile.png', size: "200x200", class: 'default-profile')
    else
    link_to attachment_image_tag(current_user, :profile_image, :fill, 40, 40,
                                format: "jpg", fallback: "default-profile.png"),
                                profile_path unless no_profile_image_exist?
    end
  end

  def midsize_thumbnail_user user
    link_to attachment_image_tag(user, :profile_image, :fill, 60, 60,
                                format: "jpg", fallback: "", class: "middle-thumbnail"),
                                user_path(user.id)
  end

  def no_profile_image_exist?
    current_user.profile_image_id.nil?
  end

end
