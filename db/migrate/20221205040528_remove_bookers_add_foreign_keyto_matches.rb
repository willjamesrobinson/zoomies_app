class RemoveBookersAddForeignKeytoMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :doggy_dates, :match, null: false, foreign_key: true
    remove_column :doggy_dates, :booker, :integer
    remove_column :doggy_dates, :bookee, :integer
  end
end
