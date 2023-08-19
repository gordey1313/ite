class MoveBodyToActionTextComment < ActiveRecord::Migration[7.0]
  def change
    Comment.all.find_each do |comments|
      comments.update(content: comments.body)
    end
    remove_column :comments, :body
  end
end
