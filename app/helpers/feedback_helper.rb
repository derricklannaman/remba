module FeedbackHelper

  private

  def display_pinned_image activity
    attachment_url(image_type(activity), :item_image, :fill, 300, 300)
  end

  def image_type activity
    activity['object'] || activity
  end

  def feedback_counter activity
    @feedback = image_type(activity).feedbacks.select { |fb| fb.user_id == current_user.id }
    @count = @feedback.group_by(&:name).flat_map {|name, feedback| [name, feedback.size]}
  end

  def feedback_totals activity
    @total_feedback = image_type(activity).feedbacks
    @count = @total_feedback.group_by(&:name).map {|name, feedback| [name, feedback.size]}.to_h
  end

  def like_it_count
    @count.present? && @count.first.eql?("Like it") ? @count : ['Like it', '0']
  end

  def love_it_count
    @count.present? && @count.first.eql?("Love it") ? @count : ['Love it', '0']
  end

  def leave_it_count
    @count.present? && @count.first.eql?("Leave it") ? @count : ['Leave it', '0']
  end

  def show_feedback_totals counts
    display_totals = []
    if counts.any?
      counts.each do |key, value|
        display_totals << compose_feedback_results("fa-thumbs-o-up", value) if key == "Like it"
        display_totals << compose_feedback_results("fa-heart-o", value) if key == "Love it"
        display_totals << compose_feedback_results("fa-thumbs-o-down", value) if key == "Leave it"
      end
    else
      display_totals = ["fa-thumbs-o-up","fa-heart-o","fa-thumbs-o-down"].map { |icon| compose_feedback_results(icon, 0) }
    end
    @display_totals = display_totals
  end

  def compose_feedback_results icon, value
    content_tag(:i, content_tag(:span, value), class: "fa #{icon} margin-spacer")
  end

  def display_feedback_counter_icon feedback_type
    case feedback_type.first
    when "Like it"
      build_feedback_icon "fa-thumbs-o-up", feedback_type
    when "Love it"
      build_feedback_icon "fa-heart-o", feedback_type
    when "Leave it"
      build_feedback_icon "fa-thumbs-o-down", feedback_type
    end
  end

  def build_feedback_icon icon, feedback_type
    content_tag(:i, content_tag(:span, feedback_type.last), class: "fa #{icon} margin-spacer")
  end
end