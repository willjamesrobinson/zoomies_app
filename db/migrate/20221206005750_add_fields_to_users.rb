class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pref_age, :integer, default: 0
    add_column :users, :pref_gender, :integer, default: 0
    add_column :users, :pref_size, :integer, default: 0
    add_column :users, :pref_personality, :integer, default: 0
  end
end
