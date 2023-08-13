class Article < ApplicationRecord
    include Visible
    has_rich_text :content

    has_many :comments, dependent: :destroy

    after_validation :set_slug, only: [:create, :update]
    
    def to_param
        #"#{id}-#{slug}"
        [id, slug].join("-")
    end
  
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 10 }


    
    scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc)}
    scope :draft, -> { where(published_at: nil)}
    scope :published, -> { where("published_at <= ?", Date.current)}
    scope :scheduled, -> { where("published_at > ?", Date.current)}

    def draft?
        published_at.nil?
    end

    def published?
        published_at? && published_at <= Date.current
    end

    def scheduled?
        published_at? && published_at > Date.current
    end
    private
        def set_slug
            self.slug = title.to_s.parameterize
        end 
end