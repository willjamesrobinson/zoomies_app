class ChangeDatetoString < ActiveRecord::Migration[7.0]
  def change
    remove_column :doggy_dates, :date, :date
    add_column :doggy_dates, :date, :string
  end
end
