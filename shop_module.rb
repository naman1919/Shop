# frozen_string_literal: true

require 'yaml'

# This module act as data source
module ShopDetails
  def users_details
    YAML.load_file 'users_data.yaml'
  end

  def products_details
    YAML.load_file 'products_data.yaml'
  end
end
