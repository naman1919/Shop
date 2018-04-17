# frozen_string_literal: true

$LOAD_PATH << '.'

require 'users_data'
require 'products_data'
require 'sellers_data'
require 'buyers_data'

user = User.new
user.display_users_details

product = Product.new
product.display_products_details

buyer = Buyer.new
buyer.buyers_details

seller = Seller.new
seller.sellers_details
user.find_users
