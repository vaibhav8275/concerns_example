class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :product_id
      t.integer :order_id
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
    add_index :transactions, :product_id
    add_index :transactions, :order_id
  end
end
