class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :capacity
      t.boolean :available
      t.references :factory

      t.timestamps
    end

    create_table :products_users, id: false do |t|
        t.references :manager
        t.references :product
    end
  end
end
