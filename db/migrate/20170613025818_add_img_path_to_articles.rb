class AddImgPathToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :img_path, :string
  end
end
