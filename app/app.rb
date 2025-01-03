# frozen_string_literal: true

require "sinatra"
require "sinatra/activerecord"
require "graphql"
require "graphql-fragment_cache"
require "json"
require_relative "config/environment"

# Require all models
Dir[File.join(__dir__, "models/*.rb")].each { |file| require file }

post "/graphql" do
  request_payload = JSON.parse(request.body.read)
  result = Schema.execute(
    request_payload["query"],
    variables: request_payload["variables"],
    context: {},
    operation_name: request_payload["operationName"]
  )
  content_type :json
  JSON.generate(result)
end
