class DoggyDatesController < ApplicationController
  def index
    # @doggy_dates = DoggyDate.where(match.matcher_id == current_user.id || match.matchee_id == current_user.id)
  end

  def show
    @doggy_date = DoggyDate.find(params[:id])
  end

  def new
    @match = Match.find(params[:match_id])
    @doggy_date = DoggyDate.new
  end

  def create
    @match = Match.find(params[:match_id])
    @message = @match.messages.build(content: "Let's go on a date", user: current_user)
    @doggydate = DoggyDate.new(doggy_date_params)
    @doggydate.message = @message
    if @match.save
      redirect_to match_path(@match)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # Save
    raise
    @doggy_date = DoggyDate.find(params[:id])
    if @doggy_date.update(doggy_date_params)
      redirect_to root_path, status: :see_other
    else
      redirect_to match_path, status: :unprocessable_entity, alert: "Try again later"
    end
  end

  def destroy
  end

  private

  def doggy_date_params
    params.require(:doggy_date).permit(:status, :location, :date)
  end
end
