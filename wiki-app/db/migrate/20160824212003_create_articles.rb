class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.string :content
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
