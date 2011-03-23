class CreateCookbooks < ActiveRecord::Migration
  def self.up
    create_table :cookbooks do |t|
      t.string :title
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :cookbooks, :user_id
  end

  def self.down
    drop_table :cookbooks
  end
end
