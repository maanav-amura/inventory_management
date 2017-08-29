class CreateInvoiceBills < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_bills do |t|
      t.integer :total_price
      t.references :user, index: true

      t.timestamps
    end

    create_table :invoice_details, id: false do |t|
      t.integer :quantity, default: 1
      t.references :product
      t.references :invoice_bill

      t.timestamps
    end
  end
end
