class DoggyDatesController < ApplicationController
  def index
    # @doggy_dates = DoggyDate.where(match.matcher_id == current_user.id || match.matchee_id == current_user.id)
  end

  def show
    @doggy_date = DoggyDate.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
