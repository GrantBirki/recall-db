# frozen_string_literal: true

require "graphql-fragment_cache"

module Types
  class QueryType < GraphQL::Schema::Object
    include GraphQL::FragmentCache::Object

    field :products, [Types::ProductType], null: false

    def products
      cache_fragment { Product.all }
    end

    # def foods
    #   Food.all
    # end
  end
end
