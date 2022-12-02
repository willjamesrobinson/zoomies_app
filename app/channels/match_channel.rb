class MatchChannel < ApplicationCable::Channel
  def subscribed
    match = Match.find(params[:id])
    stream_for match
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
