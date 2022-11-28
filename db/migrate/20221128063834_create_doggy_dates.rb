class CreateDoggyDates < ActiveRecord::Migration[7.0]
  def change
    create_table :doggy_dates do |t|
      t.date :date
      t.string :location
      t.references :match, null: false, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
