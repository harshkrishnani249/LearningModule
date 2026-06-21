class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "pending"
      t.integer :total_cents, default: 0

      t.timestamps
    end
  end
end
