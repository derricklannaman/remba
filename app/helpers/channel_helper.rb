module ChannelHelper
  def display_pinned_image activity
    attachment_url(activity['object'], :item_image, :fill, 300, 300)
  end

  def feedback_counter activity
    feedback = activity['object'].feedbacks
    feedbacks = feedback.group_by(&:name).map {|name, feedback| [name, feedback.length]}
  end

  def display_feedback_counter_icon feedback_type
    case feedback_type.first
    when "Like it"
      content_tag(:i, feedback_type.last, class: "fa fa-check margin-spacer")
    when "Love it"
      content_tag(:i, feedback_type.last, class: "fa fa-check margin-spacer")
    when "Leave it"
      content_tag(:i, feedback_type.last, class: "fa fa-check margin-spacer")
    end
  end

end