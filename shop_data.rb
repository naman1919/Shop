# frozen_string_literal: true

$LOAD_PATH << '.'
require 'shop_module'
require 'time'

# Give User Details
class User
  include ShopDetails
  def display_user_details
    users_details.each do |detail|
      detail.each do |key, value|
        puts "#{key} -> #{value}"
        if value == 'buyer'
          display_buyer_name detail
          display_buyer_age detail
        elsif value == 'seller'
          display_seller_name detail
          display_seller_age detail
        end; end; end
  end

  %w[buyer seller].each do |user|
    define_method("display_#{user}_name") do |detail|
      puts 'FULL NAME->' + detail[:first_name] + ' ' + detail[:last_name]
    end

    define_method("display_#{user}_age") do |detail|
      date_of_birth = detail[:date_of_birth]
      age = Time.now.year - Time.parse(date_of_birth).year
      puts detail[:first_name] + ' ' + detail[:last_name] +
           "'s age->" + age.to_s + 'years old'
    end
  end

  def find_details
    users_details.each do |data|
      data.each { |key, value| puts "#{key}: #{value}" if data.value?('alex') }
      print "\n"
    end
  end
end

# Give Product Details
class Product
  include ShopDetails
  def display_product_details
    puts 'PRODUCT DETAILS'

    products_details.each do |data|
      data.each { |key, value| puts "#{key} -> #{value}" }
      print "\n"
    end
  end
end

# Give Buyer Details
class Buyer < User
  def buyer_details
    puts 'BUYER DETAILS'

    users_details.each do |data|
      data.each { |key, value| puts "#{key}: #{value}" if data.value?('buyer') }
      print "\n"
    end
  end
end

# Give Seller Details
class Seller < User
  def seller_details
    puts 'SELLER DETAILS'

    users_details.each do |data|
      data.each { |key, value| puts "#{key}:#{value}" if data.value?('seller') }
      print "\n"
    end
  end
end
user = User.new
user.display_user_details
user.find_details
product = Product.new
product.display_product_details

buyer = Buyer.new
buyer.buyer_details

seller = Seller.new
seller.seller_details
