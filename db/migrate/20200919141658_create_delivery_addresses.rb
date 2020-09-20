class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.references :purchase, foreign_key: true
      t.string :postal_code, null: false
      t.integer :prefecture_id ,null: false
      t.string  :city,  null: false
      t.string  :block_number, null: false
      t.string  :building_name, default: ""
      t.string  :phone_number, null: false
      t.timestamps
    end
  end
end
