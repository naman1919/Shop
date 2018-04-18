# frozen_string_literal: true

$LOAD_PATH << '.'

require 'user_class'
require 'product_class'
require 'seller_class'
require 'buyer_class'

user = User.new
user.display_users_details

product = Product.new
product.display_products_details

buyer = Buyer.new
buyer.buyers_details

seller = Seller.new
seller.sellers_details
user.find_users
