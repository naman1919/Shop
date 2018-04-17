# frozen_string_literal: true

$LOAD_PATH << '.'
require 'datasource_module'
# Give Buyer Details
class Buyer
  include DataSource
  def buyers_details
    puts 'BUYER DETAILS'
    users_details.each do |data|
      data.each do |_key, value|
        next unless value == 'buyer'
        puts buyer_all_details data
        puts buyer_name data
        puts buyer_age data
      end
      print "\n"
    end
  end
end
