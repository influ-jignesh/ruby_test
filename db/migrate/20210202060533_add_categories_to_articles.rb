class AddCategoriesToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles, :category_id, :text, null: false
  end
end
