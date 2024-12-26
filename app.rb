# frozen_string_literal: true

require "sinatra"
require "sinatra/activerecord"
require "graphql"
require "json"
require_relative "app/graphql/types/product"
require_relative "app/graphql/types/query"
require_relative "app/graphql/schema"

set :database, { adapter: "sqlite3", database: "schemas/products/products.db" }

class Product < ActiveRecord::Base
end

post "/graphql" do
  request_payload = JSON.parse(request.body.read)
  result = Schema.execute(
    request_payload["query"],
    variables: request_payload["variables"],
    context: {}
  )
  content_type :json
  JSON.generate(result)
end
