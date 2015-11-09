class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :recipe, index: true
      t.references :chef, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :recipes
    add_foreign_key :comments, :chefs
  end
end
