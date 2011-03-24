class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title
      t.string :instructions
      t.integer :user_id
      t.integer :cookbook_id

      t.timestamps
    end
    add_index :recipes, :user_id
    add_index :recipes, :cookbook_id
  end

  def self.down
    drop_table :recipes
  end
end
