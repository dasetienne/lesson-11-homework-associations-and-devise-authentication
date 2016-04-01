class Article < ActiveRecord::Base
  belongs_to :author
  has_many :article_tags
  has_many :tags, through: :article_tags
  
  validates :title, presence: true
  validates :body, presence: true
  validates :author_id, presence: true
end
