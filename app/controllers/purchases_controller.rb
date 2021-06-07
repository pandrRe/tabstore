class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
    last_import = PurchaseImportDatum.last

    @last_import_value = 0 #need to initiliaze with 0 when there are no imports
    if !last_import.nil?
      @last_import_value = helpers.get_gross_value_from_purchases(last_import.purchases)
    end
    
    @total_value = helpers.get_gross_value_from_purchases(@purchases)
  end

  def new
  end

  def create
    uploaded_file = params[:file]
    read_file = helpers.read_file_to_text(uploaded_file)

    purchase_import_datum = PurchaseImportDatum.new(data: read_file)
    purchase_import_datum.save

    purchase_import_datum.lines.each_with_index do |line, i|
      if i != 0
        data = line.split(/\t/) #parses the line into an array of purchase information

        Purchase.create_from_array(data, purchase_import_datum.id)
      end
    end

    redirect_to '/'
  end
end
