class FollowsController < ApplicationController
  include TeamStatus

  before_action :authenticate_user!
  before_action :remove_reciprocating_follow, only: [:destroy]
  around_action :check_team_limit, only: [:create], :unless => :no_follows?
  after_action  :create_reciprocating_follow, only: [:create]

  def create
    follow = Follow.new(follow_params)
    follow.user = current_user
    if follow.save
      invoke_stream_rails(follow)
    end
    flash[:success] = "#{stylist_name(follow.target_id)} added to Team!"
    redirect_to fashionboard_path
  end

  def destroy
    follow = find_follow
    if follow.user_id == current_user.id
      follow.destroy!
      StreamRails.feed_manager.unfollow_user(follow.user_id, follow.target_id)
    end
    flash[:success] = 'Removed from Team!'
    redirect_to fashionboard_path
  end

  private

  def number_of_follows
    current_user.follows.size
  end

  def stylist_name target
    stylist_name ||= User.find(target).email
  end

  def create_reciprocating_follow
    initial_follow = Follow.retrieve_initial_follow(params)
    follow = Follow.new
    follow.target_id  = initial_follow.user_id
    follow.user_id    = initial_follow.target_id
    if follow.save
      invoke_stream_rails(follow)
    end
  end

  def remove_reciprocating_follow
    follow = find_follow
    target_id = follow.user_id
    reciprocating_follow = Follow.reciprocal_follow(target_id)
    if reciprocating_follow.present?
      user_id = follow.target_id
      reciprocating_follow.destroy
      StreamRails.feed_manager.unfollow_user(user_id, target_id)
    end
  end

  def invoke_stream_rails follow
    StreamRails.feed_manager.follow_user(follow.user_id, follow.target_id)
  end

  def find_follow
    Follow.find(params[:id])
  end

  def follow_params
    params.require(:follow).permit(:target_id)
  end

  def no_follows?
    current_user.follows.size == 0
  end

end