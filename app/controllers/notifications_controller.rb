class NotificationsController < ApplicationController
  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    if @notifications.update_all(read_at: Time.now)
      redirect_to my_matches_matches_path, status: :see_other
    else
      redirect_to my_matches_matches_path, status: :unprocessable_entity, alert: "Notifications error"
    end
  end
end
