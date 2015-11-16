class FeedbacksController < ApplicationController

  def create
    if params.keys[3].present?
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

end