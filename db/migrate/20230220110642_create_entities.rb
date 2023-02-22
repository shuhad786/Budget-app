class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount, default: 0
      t.references :users, null: false, foreign_key: { to_table: :users }
      t.references :group, null: false, foreign_key: true
 
      t.timestamps
    end
  end
end
