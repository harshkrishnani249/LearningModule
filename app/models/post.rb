class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one :latest_comment, -> { order(created_at: :desc) }, class_name: "Comment"
  validates :title, presence: true

  def trending_score
    Rails.cache.fetch("#{cache_key_with_version}/trending_score", expires_in: 1.hour) do
      sleep(1)
      comments.count * 10 + Like.where(post: self).count * 5
    end
  end
end
