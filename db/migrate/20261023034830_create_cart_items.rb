class CreateCartItems < ActiveRecord::Migration[8.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.string :product_id
      t.string :cart_id

      t.timestamps
    end
  end
end
