class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      # t.string :name, null: false
      t.string :posts_code, null: false
      t.integer :from_id, null: false
      t.string :town, null: false
      t.string :street, null: false
      t.string :building
      t.string :phone, null: false
      t.string :post_code, null: false
      t.references :purchase_record, null: false, foreign_key: true




      t.timestamps
    end
  end
end
