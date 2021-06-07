require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchases_url
    assert_response :success
  end

  test "should import purchases described in file" do
    file = fixture_file_upload('files/test_data1.tab')
    post purchases_url, params: {file: file}

    assert Purchaser.where(:name => 'Douglas').exists?
    assert Purchaser.where(:name => 'Givanildo').exists?

    import_datum = PurchaseImportDatum.find_by(data: file_fixture('test_data1.tab').read.force_encoding("UTF-8"))
    assert !import_datum.nil?
    assert import_datum.purchases.length == 2

  end
end
