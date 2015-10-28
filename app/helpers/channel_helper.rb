module ChannelHelper
  def diplay_pinned_image activity
    attachment_url(activity['object'], :item_image, :fill, 300, 300)
  end


end