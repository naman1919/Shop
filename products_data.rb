# frozen_string_literal: true

$LOAD_PATH << '.'
require 'datasource_module'
# Give Product Details
class Product
  include DataSource
  def display_products_details
    products_details.each do |data|
      data.each { |key, value| puts "#{key} -> #{value}" }
      print "\n"
    end
  end
end
