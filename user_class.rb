# frozen_string_literal: true

$LOAD_PATH << '.'
require 'datasource_module'

# Give User Details
class User
  include DataSource
  def display_users_details
    users_details.each do |data|
      data.each { |key, value| puts "#{key} -> #{value}" }
      print "\n"
    end
  end

  def find_users
    puts 'Enter user name for details'
    name = gets.chomp!
    users_details.each do |data|
      data.each { |key, value| puts "#{key}: #{value}" if data.value?(name) }
    end
  end
end
