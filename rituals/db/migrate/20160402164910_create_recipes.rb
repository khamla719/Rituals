class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :url
      t.text :direction
      t.text :story
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
