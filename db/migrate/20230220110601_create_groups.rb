class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.references :users, null: false, foreign_key: true
      t.references :entities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
