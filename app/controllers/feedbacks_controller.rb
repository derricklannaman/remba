class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.name = params[:feedback][:name]
    @feedback.item_id = params[:item_id]
    @feedback.user_id = current_user.id
    if @feedback.save
      flash[:alert] = "feedback sent!"
      redirect_to :back
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:item_id, :feedback)
  end


end