class FeedbacksController < ApplicationController
  include FeedbackHandler

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

  def destroy
    selected_feedback = Feedback.find(params[:id])
    selected_feedback.destroy
    # feedbacks = Feedback.where(user_id: current_user.id)
    # binding.pry
    # target = Feedback.where("id = ? AND user_id = ?", params[:id], current_user.id)
    # feedbacks.find {|feedback| feedback == selected_feedback }.destroy
    # binding.pry
    # feedbacks.each do |feedback|
    #   feedback.destroy if feedback == selected_feedback
    # end
    redirect_to :back
  end

end