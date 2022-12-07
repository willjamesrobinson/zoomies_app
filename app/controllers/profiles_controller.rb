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
    full_matches = (prematches + potential_matches)
    # @matches = Match.where(Match.first.matchee.dogs.first.gender == params[:gender])
    # @matches = Match.where(matchee.dogs.first.gender == params[:gender])
    # @matches = full_matches.matchee.dogs.where(gender: params[:gender])

    # match.matcher.dogs.first.gender == params[:gender] || match.matcher.dogs.first.gender == params[:gender].capitalize
    @matches = []
    full_matches.each do |match|
      matched_dogs = match.matcher == current_user ? match.matchee.dogs :  match.matcher.dogs
      matched_dogs = matched_dogs.where(size: params[:size]) if params[:size]
      matched_dogs = matched_dogs.where(gender: params[:gender]) if params[:gender]
      @matches << match if matched_dogs.present?

      # if match.matcher == current_user



      #   @matches << match
      #   else matched_dogs = match.matchee.dogs.where(size: params[:size]).where(gender: params[:gender])
      #   @matches << match if !matched_dogs.empty?
      #   elsif match.matchee == current_user
      #   matched_dogs = match.matcher.dogs.where(size: params[:size]).where(gender: params[:gender])
      #   # if match.matcher.dogs.any? { |dog| dog.gender.downcase == params[:gender] } &&
      #   # # match.matcher.dogs.any? { |dog| dog.age == params[:age] } &&
      #   # match.matcher.dogs.any? { |dog| dog.size == params[:size] }
      #   # @matches << match
      #   # end
      #   # match.matcher.dogs.any? { |dog| dog.personality == params[:personality] }
      #   # else match.matcher == current_user
      #   #     match.matchee.dogs.any? { |dog| dog.gender.downcase == params[:gender] } &&
      #   #     #   match.matchee.dogs.any? { |dog| dog.age == params[:age] } &&
      #   #       match.matchee.dogs.any? { |dog| dog.size == params[:size] }
      #   #     #   match.matchee.dogs.any? { |dog| dog.personality == params[:personality] }
      # end
    end

    # @matches = full_matches.select do |match|
    #  true

      # match.matcher.dogs.first.gender == params[:gender]
      # || match.matcher.dogs.first.gender == params[:gender].capitalize
      # match.matcher.dogs.first.gender == params[:gender] || match.matcher.dogs.first.gender == params[:gender].capitalize

      # match.matchee.dogs.first.where(gender: params[:gender]).nil?
      # full_matches.first.matchee.dogs.first.gender
   # end


  end

  # def filtered_by_gender
  # end

  # def dogs_by_preferences
  #   @dogs = Dog.where(nil)
  #   @dogs = @dogs.filter_by_location(params[:location]) if params[:location].present?
  #   @dogs = @dogs.filter_by_age(params[:age]) if params[:age].present?
  #   @dogs = @dogs.filter_by_gender(params[:gender]) if params[:gender].present?
  #   @dogs = @dogs.filter_by_size(params[:size]) if params[:size].present?
  #   @dogs = @dogs.filter_by_personality(params[:personailty]) if params[:personality].present?
  # end

  private

  def filtering_params(params)
    params.slice(:location, :gender, :age, :size, :personality)
  end
end
