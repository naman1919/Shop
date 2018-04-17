# frozen_string_literal: true

require 'time'
require 'yaml'
# All details are stored in this module
module DataSource
  def users_details
    YAML.load_file 'users_data.yaml'
  end

  def products_details
    YAML.load_file 'products_data.yaml'
  end
  %w[buyer seller].each do |user|
    define_method("#{user}_name") do |detail|
      'FULL NAME->' + detail[:first_name] + ' ' + detail[:last_name]
    end

    define_method("#{user}_age") do |detail|
      date_of_birth = detail[:date_of_birth]
      age = Time.now.year - Time.parse(date_of_birth).year
      detail[:first_name] + ' ' + detail[:last_name] +
        "'s age->" + age.to_s + 'years old'
    end

    define_method("#{user}_all_details") do |detail|
      detail.each { |key, value| puts "#{key}: #{value}" }
      print "\n"
    end
  end
end
