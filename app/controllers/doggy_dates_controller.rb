class DoggyDatesController < ApplicationController
  def index
    @doggy_dates = current_user.doggy_dates
    @pending_dates = @doggy_dates.select do |pending|
      pending.status == "pending"
    end
    @accepted_dates = @doggy_dates.select do |accepted|
      accepted.status == "accepted"
    end
  end

  def show
    @doggy_date = DoggyDate.find(params[:id])
  end

  def current_user?
    if current_user.id == pd.match.matcher_id
      "#{pd.match.matchee.first_name}"
    else
      "#{pd.match.matcher.first_name}"
    end
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
    @doggydate.match = @match
    if @match.save
      redirect_to match_path(@match)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # Save
    @doggy_date = DoggyDate.find(params[:id])
    if @doggy_date.update(doggy_date_params)
      redirect_to root_path, status: :see_other
    else
      redirect_to match_path, status: :unprocessable_entity, alert: "Try again later"
    end
  end

  def destroy
    @doggydate = DoggyDate.find(params[:id])
    @doggydate.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to doggy_dates_path, status: :see_other
  end

  private

  def doggy_date_params
    params.require(:doggy_date).permit(:status, :location, :date)
  end
end
