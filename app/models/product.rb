class Product < ApplicationRecord
  has_many :line_items
  validates :name, presence: true
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
end
