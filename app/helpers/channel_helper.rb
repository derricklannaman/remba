module ChannelHelper

  private

  def display_pinned_image activity
    attachment_url(image_type(activity), :item_image, :fill, 300, 300)
  end

  def image_type activity
    activity['object'] || activity
  end

  def feedback_counter activity
    @feedback = image_type(activity).feedbacks
    @like_count, @love_count, @leave_count = @feedback.group_by(&:name)
                                .map {|name, feedback| [name, feedback.size]}
# binding.pry
    # @feedback.group_by(&:name).map {|name, feedback| [name, feedback.size]}
    # @feedback.group_by(&:name).map {|name, feedback| [name, feedback.size]}.each do |feedback|
    # #   # @like_count = feedback if feedback.first == "Like it"
    # #   # @love_count = feedback if feedback.first == "Love it"
    # #   # @leave_count = feedback if feedback.first == "Leave it"
    # binding.pry
    #   if feedback.first == "Like it"
    #     @like_count = feedback
    #   elsif feedback.first == "Love it"
    #     @love_count = feedback
    #   elsif feedback.first == "Leave it"
    #     @leave_count = feedback
    #   end
    # end
  end

  def like_it_count
    @like_count.present? ? @like_count : ['Like it', '0']
  end

  def love_it_count
    @love_count.present? ? @love_count : ['Love it', '0']
  end

  def leave_it_count
    @leave_count.present? ? @leave_count : ['Leave it', '0']
  end

  def display_feedback_counter_icon feedback_type
    # binding.pry
    case feedback_type.first
    when "Like it"
      select_icon "fa-thumbs-o-up", feedback_type
    when "Love it"
      select_icon "fa-heart-o", feedback_type
    when "Leave it"
      select_icon "fa-thumbs-o-down", feedback_type
    end
  end

  def select_icon icon, feedback_type
    # binding.pry
    content_tag(:i, content_tag(:span, feedback_type.last), class: "fa #{icon} margin-spacer") #unless feedback_type.last == 0
  end


end