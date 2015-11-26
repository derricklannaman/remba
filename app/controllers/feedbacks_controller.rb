class FeedbacksController < ApplicationController
  include FeedbackHandler

  def create
    if feedback_name_is_present? && feedback_valid?
      feedback = Feedback.new
      feedback.name = params.values[3]
      feedback.item_id = params[:item_id]
      feedback.user_id = current_user.id
      if feedback.save
        redirect_to :back
      end
    else
      redirect_to :back, alert: "Oops! You submitted without giving feedback.
                                 Please provide feedback first."
    end
  end

  def destroy
    feedback = Feedback.find(params[:id])
    feedback.destroy
    redirect_to :back
  end

end