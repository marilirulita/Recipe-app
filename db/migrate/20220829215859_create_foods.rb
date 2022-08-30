class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name, null: false, unique: true
      t.string :measurement_unit, null: false, default: 'pcs'
      t.integer :price, null: false, default: 0
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
