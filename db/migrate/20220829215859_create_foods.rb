class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, unique: true
      t.integer :preparation_time, null: false
      t.integer :cooking_time, null: false
      t.text :description
      t.boolean :public, null: false, default: true
      t.timestamps
    end
  end
end
