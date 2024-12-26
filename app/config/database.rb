# frozen_string_literal: true

require "sinatra/activerecord"

# Configure the databases
set :databases, {
  products: { adapter: "sqlite3", database: "schemas/products/products.db" }
  # foods: { adapter: "sqlite3", database: "schemas/foods/foods.db" }
}

# establish a connection for the products database
ActiveRecord::Base.establish_connection(settings.databases[:products])
