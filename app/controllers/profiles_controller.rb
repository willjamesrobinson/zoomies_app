class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def matches
    # People who have accepted us, match exists:
    matches = Match.where(matchee_id: current_user.id)
    prematches = matches.where(status: "pending")
    # There is no match yet, make one thats not yet saved:
    users_matched = []
    matches1 = Match.where(matchee_id: current_user.id)
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
      users_matched.exclude?(user)
    end
    potential_matches = users_not_matched.map do |user|
      Match.new(matcher_id: current_user.id, matchee_id: user.id)
    end
    # Mix the two arrays together
    @matches = (prematches + potential_matches).shuffle
  end
end
