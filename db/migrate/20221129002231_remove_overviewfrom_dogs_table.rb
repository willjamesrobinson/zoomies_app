class RemoveOverviewfromDogsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :dogs, :overview
    add_column :users, :overview, :string
  end
end
