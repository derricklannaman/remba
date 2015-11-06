module ChannelHelper
  def display_pinned_image activity
    attachment_url(activity['object'], :item_image, :fill, 300, 300)
  end

  def feedback_counter activity
    feedback = activity['object'].feedbacks
    feedbacks = feedback.group_by(&:name).map {|name, feedback| [name, feedback.length]}
  end

  def display_feedback_counter_icon feedback_type
    if feedback_type.first == "Like it"
      "<i class='fa fa-check margin-spacer'>#{feedback_type.last}</i>".html_safe
    elsif feedback_type.first == "Love it"
      "<i class='fa fa-heart margin-spacer'>#{feedback_type.last}</i>".html_safe
    elsif feedback_type.first == "Leave it"
      "<i class='fa fa-thumbs-down margin-spacer'>#{feedback_type.last}</i>".html_safe
    end
  end

end