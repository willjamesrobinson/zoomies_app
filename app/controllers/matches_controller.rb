class MatchesController < ApplicationController
  def my_matches
    @matches1 = Match.where(matchee_id: current_user.id).where(status: 2)
    @matches2 = Match.where(matcher_id: current_user.id).where(status: 2)

  end

  def destroy
  end

  def show
    @match = Match.find(params[:id])
    @message = Message.new
  end

  def create
    match = Match.new(match_params)
    if match.save
      redirect_to matches_path
    else
      redirect_to matches_path, status: :unprocessable_entity, alert: "Try again later"
    end
  end

  def update
    # Save
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to matches_path, status: :see_other
    else
      redirect_to matches_path, status: :unprocessable_entity, alert: "Try again later"
    end
  end

  private

  def match_params
    params.require(:match).permit(:status, :matchee_id, :matcher_id)
  end

end
