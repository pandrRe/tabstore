class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :item, null: false, foreign_key: true
      t.references :purchaser, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true
      t.integer :count, null: false

      t.timestamps
    end
  end
end
