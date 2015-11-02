module ChannelHelper
  def diplay_pinned_image activity
    attachment_url(activity['object'], :item_image, :fill, 300, 300)
  end

  def feedback_counter activity
    feedback = activity['object'].feedbacks
    feedbacks = feedback.group_by(&:name).map {|name, feedback| [name, feedback.length]}
  end
end