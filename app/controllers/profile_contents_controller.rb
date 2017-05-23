class ProfileContentsController < ApplicationController
  def index
  end

  def new
    @profile = ProfileContent.new
  end

  def edit
  end

  def create
    @profile = ProfileContent.new
  end

  def show
  end
end
