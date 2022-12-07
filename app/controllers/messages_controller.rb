class MessagesController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.user = current_user
    if @message.save
      # Create Notification (for the other user, not current_user)
      recipient_user = @match.matcher == current_user ? @match.matchee : @match.matcher
      Notification.create(recipient: recipient_user, actor: current_user, action: "messaged", notifiable: @message)
      # Broadcast
      MatchChannel.broadcast_to(
        @match,
        {
          html: render_to_string(partial: "message", locals: {message: @message}),
          senderId: current_user.id
        }
      )
      head :ok
    else
      render "matches/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
