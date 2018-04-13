require 'time'

$LOAD_PATH << "."
require "shop_module"

class User
  include ShopDetails
  def display_user_details
    user_details
    puts "----------USER DETAILS-------------"

    @user_data.each do |detail|
      detail.each do |key, value|
        puts "#{key} -> #{value}"
        
        if value == "buyer"
          display_buyer_name detail
          display_buyer_age detail
        elsif value == "seller"
          display_seller_name detail
          display_seller_age detail 
        end
      end
      print "\n"
    end
  end

  ['buyer', 'seller'].each do |user|
    define_method("display_#{user}_name") do |detail|
      puts "FULL NAME->"+detail[:first_name]+" "+detail[:last_name]
    end
  end

  ['buyer', 'seller'].each do |user|
    define_method("display_#{user}_age") do |detail|
      date_of_birth = detail[:date_of_birth]
      age = Time.now.year - Time.parse(date_of_birth).year
      puts detail[:first_name]+" "+detail[:last_name]+"'s age->"+age.to_s+"years old"
    end
  end

  def find_details
    user_details

    @user_data.each do |detail|
      detail.each { |key, value| puts "#{key} -> #{value}" if detail.has_value?("alex")}
      print "\n"
    end
  end
end

class Product
  include ShopDetails
  
  def display_product_details
    product_details
    puts "----------------PRODUCT DETAILS------------------"

    @product_details.each do |detail|
      detail.each { |key, value| puts "#{ key } -> #{value}"}
      print "\n"
    end
  end
end

class Buyer < User
  def buyer_details
    user_details
    puts "---------------------------------BUYER DETAILS-----------------------"

    @user_data.each do |detail|
      detail.each { |key, value| puts "#{key} -> #{value}" if detail.has_value?("buyer") }
      print "\n"
    end
  end
end

class Seller < User
  def seller_details
    user_details
    puts "---------------------------------SELLER DETAILS-----------------------"

    @user_data.each do |detail|
      detail.each { |key, value| puts "#{key} -> #{value}" if detail.has_value?("seller") }
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
