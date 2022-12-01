class RemoveMatchId < ActiveRecord::Migration[7.0]
  def change
    remove_column :doggy_dates, :match_id
  end
end
