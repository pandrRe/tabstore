class AddImportDatumToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :purchase_import_datum, null: false, foreign_key: true
  end
end
