class CreatePurchaseImportData < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_import_data do |t|
      t.text :data, null: false

      t.timestamps
    end
  end
end
