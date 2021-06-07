module PurchasesHelper
    def read_file_to_text(file)
        file.read.force_encoding("UTF-8")
    end

    def get_gross_value_from_purchases(purchases)
        if purchases.nil?
            return 0
        end

        purchases.map{|purchase| purchase.count * purchase.item.price }.reduce(0, :+)
    end
end
