# frozen_string_literal: true

module Types
  class QueryType < GraphQL::Schema::Object
    field :products, [Types::ProductType], null: false

    def products
      Product.all
    end

    # def foods
    #   Food.all
    # end
  end
end
