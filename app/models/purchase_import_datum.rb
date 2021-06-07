class PurchaseImportDatum < ApplicationRecord
    has_many :purchases

    def lines
        data.split(/\n+/)
    end
end
