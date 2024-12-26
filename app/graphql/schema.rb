# frozen_string_literal: true

class Schema < GraphQL::Schema
  use GraphQL::FragmentCache

  query(Types::QueryType)
end
