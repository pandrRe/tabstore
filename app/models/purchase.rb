class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :purchase_import_datum

  #Array: [purchaser name, item description, item price, purchase count, merchant address, merchant name]
  def self.create_from_array(array, datum_id)
    purchaser = Purchaser.find_or_create_by(name: array[0])
    item = Item.find_or_create_by(description: array[1], price: array[2])
    merchant = Merchant.find_or_create_by(name: array[5], address: array[4])

    purchase = Purchase.new(count: array[3], purchaser_id: purchaser.id, item_id: item.id, merchant_id: merchant.id, purchase_import_datum_id: datum_id)
    purchase.save

    purchase
  end
end
