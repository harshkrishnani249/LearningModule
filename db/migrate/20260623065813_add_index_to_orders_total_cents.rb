class AddIndexToOrdersTotalCents < ActiveRecord::Migration[8.1]
  disable_ddl_transaction!
  def change
    add_index :orders, :total_cents, algorithm: :concurrently
  end
end
