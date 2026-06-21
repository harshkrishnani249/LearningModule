class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def self.place!(user:, items:) # items = [[product, qty], ...]
    transaction do
      order = create!(user: user, status: "pending")
      items.each { |product, qty| order.line_items.create!(product: product, quantity: qty) }
      order.update!(total_cents: order.line_items.joins(:product).sum("products.price_cents * line_items.quantity"))
      order.update!(status: "paid")
      order
    end
  end
end
