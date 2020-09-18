class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string  :name, null:false
      t.string  :price,     null:false
      t.text  :introduction,   null:false
      t.integer :category_id,  null:false
      t.integer :status_id,    null:false
      t.integer :shipping_fee_id,  null:false
      t.integer :shipping_day_id,  null:false
      t.string  :prefecture_id,  null:false
      t.timestamps

    end
  end
end
