class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :matchee, references: :user, foreign_key: { to_table: :users }
      t.references :matcher, references: :user, foreign_key: { to_table: :users }
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
