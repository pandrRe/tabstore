class PurchasesHelperTest < ActionView::TestCase
    test "should return full gross value of all fixture purchases" do
        value = get_gross_value_from_purchases(purchases())
        assert value == 8
    end

    test "should read the full content of a text file" do
        text = read_file_to_text(fixture_file_upload('files/test_data2.txt'))
        assert text == 'File to be read in helper test.\n'
    end
  end
  