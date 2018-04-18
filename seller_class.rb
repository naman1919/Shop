# frozen_string_literal: true

$LOAD_PATH << '.'
require 'datasource_module'
# Give Seller Details
class Seller
  include DataSource
  def sellers_details
    puts 'SELLER DETAILS'

    users_details.each do |data|
      data.each do |_key, value|
        next unless value == 'seller'
        puts seller_all_details data
        puts seller_name data
        puts seller_age data
      end
      print "\n"
    end
  end
end
