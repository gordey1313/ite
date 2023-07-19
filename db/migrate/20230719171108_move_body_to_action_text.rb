class MoveBodyToActionText < ActiveRecord::Migration[7.0]
  def change
    Article.all.find_each do |articles|
      articles.update(content: articles.body)
  end

  remove_column :articles, :body
  end
end
