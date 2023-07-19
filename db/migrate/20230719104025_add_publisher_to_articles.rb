class AddPublisherToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published_at, :date
  end
end
