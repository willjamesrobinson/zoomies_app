class CreateParks < ActiveRecord::Migration[7.0]
  def change
    create_table :parks do |t|
      t.string :address
      t.string :name
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
