class FollowsController < ApplicationController
  before_action :authenticate_user!
  after_action :create_reciprocating_follow, only: [:create]
  before_action :remove_reciprocating_follow, only: [:destroy]

  def create
    follow = Follow.new(follow_params)
    follow.user = current_user
    if follow.save
      StreamRails.feed_manager.follow_user(follow.user_id, follow.target_id)
    end
    flash[:success] = 'Added to Team!'
    redirect_to fashionboard_path
  end

  def destroy
    follow = Follow.find(params[:id])
    if follow.user_id == current_user.id
      follow.destroy!
      StreamRails.feed_manager.unfollow_user(follow.user_id, follow.target_id)
    end
    flash[:success] = 'Removed from Team!'
    redirect_to fashionboard_path
  end

  private

  def create_reciprocating_follow
    first_follow_instance = Follow.find_by_target_id(params[:follow][:target_id].to_i)
    new_followed_target_id = first_follow_instance.user_id
    new_user_id = first_follow_instance.target_id

    follow = Follow.new
    follow.target_id = new_followed_target_id
    follow.user_id = new_user_id
    if follow.save
      StreamRails.feed_manager.follow_user(follow.user_id, follow.target_id)
    end
  end

  def remove_reciprocating_follow
    follow = Follow.find(params[:id])
    new_target_id = follow.user_id
    reciprocating_follow = Follow.where(target_id: new_target_id)
    if reciprocating_follow.present?
      new_user_id = follow.target_id
      reciprocating_follow.first.destroy
      StreamRails.feed_manager.unfollow_user(new_user_id, new_target_id)
    end
  end

  def follow_params
    params.require(:follow).permit(:target_id)
  end
end