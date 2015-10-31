class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    binding.pry
    @feedback = Feedback.new(feedback_params)
    render @feedback
  end


end