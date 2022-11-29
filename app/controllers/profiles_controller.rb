class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def prematches
    @prematches = Match.where(matchee_id: current_user.id)
  end
end
