module ChannelHelper
  def display_pinned_image activity
    attachment_url(activity['object'], :item_image, :fill, 300, 300)
  end

  def feedback_counter activity
    @feedback = activity['object'].feedbacks
    @like_count, @love_count, @leave_count = @feedback.group_by(&:name)
                                .map {|name, feedback| [name, feedback.size]}
  end

  def like_it_count
    @like_count.present? ? @like_count : ['Like it', 0]
  end

  def love_it_count
    @love_count.present? ? @love_count : ['Love it', 0]
  end

  def leave_it_count
    @leave_count.present? ? @leave_count : ['Leave it', 0]
  end

  def display_feedback_counter_icon feedback_type
    # TODO: refactor this shit
    case feedback_type.first
      when "Like it"
        content_tag(:i, content_tag(:span, feedback_type.last), class: "fa fa-thumbs-up margin-spacer")
      when "Love it"
        content_tag(:i, content_tag(:span, feedback_type.last), class: "fa fa-heart margin-spacer")
      when "Leave it"
        content_tag(:i, content_tag(:span, feedback_type.last), class: "fa fa-thumbs-down margin-spacer")
    end
  end


end