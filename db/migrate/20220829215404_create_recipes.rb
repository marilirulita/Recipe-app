class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end

