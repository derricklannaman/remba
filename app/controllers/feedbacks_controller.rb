class FeedbacksController < ApplicationController

  def create
    if feedback_name_is_present? && feedback_valid?
      feedback = Feedback.new
      feedback.name = params.values[3]
      feedback.item_id = params[:item_id]
      feedback.user_id = current_user.id
      if feedback.save
        redirect_to :back, alert: "Your feedback was sent."
      end
    else
      redirect_to :back, alert: "Oops! You submitted without giving feedback.
                                 Please provide feedback first."
    end
  end

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

  def destroy
    selected_feedback = Feedback.find(params[:id])
    feedbacks = Feedback.where(user_id: current_user.id)
    feedbacks.each do |feedback|
      feedback.destroy if feedback == selected_feedback
    end
    redirect_to :back
  end

end