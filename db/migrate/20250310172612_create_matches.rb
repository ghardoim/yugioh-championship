class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :player_1, null: false, foreign_key: { to_table: :players }
      t.references :player_2, null: false, foreign_key: { to_table: :players }
      t.integer :wins1
      t.integer :wins2

      t.timestamps
    end
  end
end
