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
    if @total_feedback.count <= 1
      @count = @total_feedback.group_by(&:name).flat_map {|name, feedback| [name, feedback.size]}
    else
      @count = @total_feedback.group_by(&:name).map {|name, feedback| [name, feedback.size]}.to_h
    end
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
    @display_totals = []
    if counts.empty?
      counts = {"Like it"=> 0, "Love it"=> 0, "Leave it"=> 0}
      # counts << ["Like it", 0] << ["Love it", 0] << ["Leave it", 0]
    else
      missing_feedback = ['Like it', 'Love it', 'Leave it'] - counts.keys
    end
    if missing_feedback.blank?
      # @display_totals = [["Like it", 0],["Love it", 0],["Leave it", 0]]
    else missing_feedback.present?
      missing_feedback.each do |missing|
        missing_feedback_element = {"#{missing}" => 0}
        counts.merge! missing_feedback_element
      end
    end
    if counts.any?
      counts.each do |key, value|
        if key == "Like it"
          @display_totals << display_feedback_results("fa-thumbs-o-up", value)
        end
        if key == "Love it"
          @display_totals << display_feedback_results("fa-heart-o", value)
        end
        if key == "Leave it"
          @display_totals << display_feedback_results("fa-thumbs-o-down", value)
        end
      end
    end
    @display_totals
  end

  def display_feedback_results icon, value
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