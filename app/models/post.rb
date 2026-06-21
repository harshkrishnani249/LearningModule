class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one :latest_comment, -> { order(created_at: :desc) }, class_name: "Comment"
  validates :title, presence: true
end
