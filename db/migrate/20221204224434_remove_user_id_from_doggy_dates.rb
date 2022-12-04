class RemoveUserIdFromDoggyDates < ActiveRecord::Migration[7.0]
  def change
    remove_column :doggy_dates, :user_id
  end
end
