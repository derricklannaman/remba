module ProfileImagesHelper

  def profile_picture
    if profile_image_exist?(current_user)
      user_image(current_user, 200, "default-profile")
    else
      generic_profile_image(200, "default-profile")
    end
  end

  def show_current_user_profile_image user, img_size, css_style
    if profile_image_exist?(user)
      link_to user_image(user, img_size, css_style), profile_path
    else
      link_to generic_profile_image(img_size, "default-profile"), profile_path
    end
  end

  def show_user_profile_image user, img_size, css_style
    if profile_image_exist?(user)
      if user == current_user
        link_to user_image(user, img_size, css_style), profile_path
      else
        link_to user_image(user, img_size, css_style), user_path(user.id)
      end
    else
      link_to generic_profile_image(img_size, "fallback-profile"), user_path(user.id)
    end
  end

  def user_image user, img_size, css_style
    attachment_image_tag(user, :profile_image, :fill,"#{img_size}","#{img_size}",
                              format: "jpg", class: "#{css_style}", fallback: "default-profile.png")
  end

  def generic_profile_image img_size, placeholder_image_style
    image_tag('default-profile.png', size: "#{img_size}x#{img_size}", class: "#{placeholder_image_style}")
  end

  def profile_image_exist? user
    user.profile_image_id.present?
  end
end