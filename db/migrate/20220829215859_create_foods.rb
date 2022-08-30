class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
<<<<<<< HEAD
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name, null: false, unique: true
      t.string :measurement_unit, null: false, default: 'pcs'
      t.integer :price, null: false, default: 0
      t.integer :quantity, null: false, default: 1
=======
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, unique: true
      t.integer :preparation_time, null: false
      t.integer :cooking_time, null: false
      t.text :description
      t.boolean :public, null: false, default: true
>>>>>>> 7dd6b5e6723be8c681f30ec75e2c0a1ee93cf1a7
      t.timestamps
    end
  end
end
