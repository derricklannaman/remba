module FeedbackHandler
  def feedback_name_is_present?
    params.keys[3].present?
  end

  def feedback_valid?
     like_it_valid? || love_it_valid? || leave_it_valid?
  end

  def like_it_valid?
    params.values[3] == "Like it"
  end

  def love_it_valid?
    params.values[3] == "Love it"
  end

  def leave_it_valid?
    params.values[3] == "Leave it"
  end
end