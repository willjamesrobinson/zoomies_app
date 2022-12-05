class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def matches
    # Determining location of current user.
    # result = request.location
    # current_user.address = result.address
    # current_user.latitude = result.coordinates[0]
    # current_user.longitude = result.coordinates[1]
    # People who have accepted us, match exists:
    matches = Match.where(matchee_id: current_user.id)
    prematches = matches.where(status: "pending")
    # There is no match yet, make one thats not yet saved:
    users_matched = []
    matches1 = Match.where(matchee_id: current_user.id)
    # && Match.where(match.matcher.nearbys(10))
    matches1.each do |match|
      users_matched << match.matcher
    end
    matches2 = Match.where(matcher_id: current_user.id)
    matches2.each do |match|
      users_matched << match.matchee
    end
    users_matched << current_user
    users = User.all
    users_not_matched = users.select do |user|
      users_matched.exclude?(user) && !user.dogs.empty? # ONLY USERS WITH DOGS CAN MATCH
    end
    potential_matches = users_not_matched.map do |user|
      Match.new(matcher_id: current_user.id, matchee_id: user.id)
    end
    # Mix the two arrays together
    @matches = (prematches + potential_matches).shuffle
  end

  def settings
    @dogs = Dog.where(nil)
    @dogs = @dogs.filter_by_location(params[:location]) if params[:location].present?
    @dogs = @dogs.filter_by_gender(params[:gender]) if params[:gender].present?
    @dogs = @dogs.filter_by_age(params[:age]) if params[:age].present?
    @dogs = @dogs.filter_by_size(params[:size]) if params[:size].present?
    @dogs = @dogs.filter_by_personality(params[:personailty]) if params[:personality].present?
  end

  private

  def filtering_params(params)
    params.slice(:location, :gender, :age, :size, :personality)
  end

end
