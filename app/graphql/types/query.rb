# frozen_string_literal: true

require "graphql-fragment_cache"

module Types
  class QueryType < GraphQL::Schema::Object
    include GraphQL::FragmentCache::Object

    field :products, [Types::ProductType], null: false do
      argument :search, String, required: false
      argument :date, String, required: false
    end

    def products(search: nil, date: nil)
      scope = Product.all
      scope = apply_search(scope, search) if search
      scope = apply_date_filter(scope, date) if date
      cache_fragment { scope }
    end

    # def foods
    #   Food.all
    # end

    private

    def apply_search(scope, search, searchable_fields)
      search_pattern = "%#{search}%"

      conditions = searchable_fields.map do |field|
        Product.arel_table[field].matches(search_pattern)
      end

      scope.where(conditions.reduce(:or))
    end

    def apply_date_filter(scope, date)
      begin
        parsed_date = Date.parse(date)
        scope.where("date(date) = ?", parsed_date)
      rescue ArgumentError
        scope.where("strftime('%Y', date) = ?", date)
      end
    end
  end
end
