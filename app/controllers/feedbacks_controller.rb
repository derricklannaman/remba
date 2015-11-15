class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    if params.has_key? :feedback
      feedback = Feedback.new feedback_params
      feedback.name = params[:feedback][:name]
      feedback.item_id = params[:item_id]
      feedback.user_id = current_user.id
      if feedback.save
        redirect_to :back, alert: "feedback sent!"
      end
    else
      redirect_to :back, alert: "Oops! You submitted without giving feedback.
                                 Please provide feedback first."
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:item_id, :feedback, :name)
  end


end