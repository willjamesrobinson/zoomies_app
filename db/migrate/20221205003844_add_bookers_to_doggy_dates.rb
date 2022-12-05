class AddBookersToDoggyDates < ActiveRecord::Migration[7.0]
  def change
    add_column :doggy_dates, :booker, :integer
    add_column :doggy_dates, :bookee, :integer
  end
end
