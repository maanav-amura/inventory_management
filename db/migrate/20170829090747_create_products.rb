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
  end
end
