class Comment < ApplicationRecord
  include Visible
  has_rich_text :content
  belongs_to :article
end
