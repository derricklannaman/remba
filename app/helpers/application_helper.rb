module ApplicationHelper

  def when_pinned activity
    pin_id = activity['foreign_id'].split(':').last
    pin = Pin.find(pin_id)
    time_ago_in_words pin.created_at
  end


end
