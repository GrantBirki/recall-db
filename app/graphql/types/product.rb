# frozen_string_literal: true

module Types
  class ProductType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :sha, String, null: false
    field :recall_number, String, null: true
    field :warning_number, String, null: true
    field :date, String, null: true
    field :warning_date, String, null: true
    field :recall_heading, String, null: true
    field :product_name, String, null: true
    field :description, String, null: true
    field :hazard_description, String, null: true
    field :consumer_action, String, null: true
    field :original_warning_announcement, String, null: true
    field :remedy_type, String, null: true
    field :units, String, null: true
    field :incidents, String, null: true
    field :remedy, String, null: true
    field :sold_at_label, String, null: true
    field :sold_at, String, null: true
    field :importers, String, null: true
    field :manufacturers, String, null: true
    field :distributors, String, null: true
    field :manufactured_in, String, null: true
    field :custom_label, String, null: true
    field :custom_field, String, null: true
  end
end
