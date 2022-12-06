class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient: current_user).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notification.update_all(read_at: Time.zone.now)
  end
end
