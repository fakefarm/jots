class CreateJots < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :entry
      t.string :title_without_tag
      t.text :body
      t.integer :user_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
