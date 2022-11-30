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
    # Save
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to prematches_path, status: :see_other
    else
      redirect_to root_path, status: :unprocessable_entity, alert: "No deal"
    end
  end

  private

  def match_params
    params.require(:match).permit(:status)
  end

end
