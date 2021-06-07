require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test "should not save purchase with missing info" do
    purchase = Purchase.new
    assert_not purchase.save
  end

  test "should create purchase from array with existing parents" do
    import_datum = purchase_import_data(:one)
    #Array: [purchaser name, item description, item price, purchase count, merchant address, merchant name]
    array = ["Fulano", "Item One", 1.00, 6, "Avenue Two", "Merchant Two"]
    purchase = Purchase.create_from_array(array, import_datum.id)

    assert Purchase.last == purchase
    assert Purchase.where(:purchaser_id => purchasers(:one), :merchant_id => merchants(:two)).exists?
  end

  test "should create purchase from array with non-existing parents" do
    import_datum = purchase_import_data(:two)
    array = ["Beltrano", "Item Three", 3.00, 1, "Avenue Three", "Merchant Three"]
    purchase = Purchase.create_from_array(array, import_datum.id)

    assert Purchase.last == purchase
    assert Merchant.last.name == "Merchant Three"
    assert Item.last.description == "Item Three"
    assert Purchaser.last.name = "Beltrano"
    assert Purchase.where(:purchaser_id => Purchaser.last.id, :merchant_id => Merchant.last.id, :item_id => Item.last.id).exists?
  end
end
