class CreateJots < ActiveRecord::Migration
  def change
    create_table :jots do |t|
      t.string :title
      t.string :title_without_tag
      t.text :body
      t.integer :user_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
