class MatchesController < ApplicationController
  def my_matches
    @matches = current_user.matches.order(match.timestamp, desc)
  end

  def destroy
  end

  # Match Exists between two users or needs to be created?
  # Create new match, current user set to matcher, other person is matchee
  # Tick or X is +1, 0 added to status respectively, to correlate with MATCH

  def create
    Match.create(matcher_id: current_user.id)
  end

  def update
  end

  private

end
