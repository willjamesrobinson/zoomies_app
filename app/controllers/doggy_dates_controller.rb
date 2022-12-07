
require 'http'
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
    get_park = HTTP.get("https://api.mapbox.com/geocoding/v5/mapbox.places/park.json?type=poi&proximity=#{current_user.longitude},#{current_user.latitude}&access_token=#{ENV['MAPBOX_API_KEY']}")
    get_park_parsed = JSON.parse(get_park)
    features = get_park_parsed["features"]
    # for loop needed in page to grab co-ordinates
    park_array = []
    for i in (1..5)
      park = features[i-1]
      name = park["place_name"]
      coord = park.dig "geometry", "coordinates"
      park = Park.create(
        address: name,
        latitude: coord[1],
        longitude: coord[0]
      )
      park_array << park
    end
    @markers = park_array.map do |dog_park|
      {
        lat: dog_park.latitude,
        lng: dog_park.longitude,
        info_window: render_to_string(partial: "info_window", locals: {dog_park: dog_park})
        }
    end
    console
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

  def image_scraper(address)
    scraper = Scrapix::GoogleImages.new
    scraper.query = address
    scraper.total = 1
    scraper.find
  end

  def doggy_date_params
    params.require(:doggy_date).permit(:status, :location, :date)
  end
end
