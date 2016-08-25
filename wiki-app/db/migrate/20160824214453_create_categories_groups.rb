class CreateCategoriesGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_groups do |t|
      t.integer :group_id
      t.integer :category_id

      t.timestamps
    end
  end
end
