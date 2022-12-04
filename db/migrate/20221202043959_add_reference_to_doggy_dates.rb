class AddReferenceToDoggyDates < ActiveRecord::Migration[7.0]
  def change
    add_reference :doggy_dates, :user, null: false, foreign_key: true
  end
end
