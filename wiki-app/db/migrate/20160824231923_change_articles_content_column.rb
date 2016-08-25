class ChangeArticlesContentColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :content, :text
  end
end
