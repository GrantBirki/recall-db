# frozen_string_literal: true

module Types
  class ProductType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :sha, String, null: false
    field :recall_number, String, null: true, method: :recall_number
    field :warning_number, String, null: true, method: :warning_number
    field :date, String, null: true, method: :date
    field :warning_date, String, null: true, method: :warning_date
    field :recall_heading, String, null: true, method: :recall_heading
    field :product_name, String, null: true, method: :product_name
    field :description, String, null: true, method: :description
    field :hazard_description, String, null: true, method: :hazard_description
    field :consumer_action, String, null: true, method: :consumer_action
    field :original_warning_announcement, String, null: true, method: :original_warning_announcement
    field :remedy_type, String, null: true, method: :remedy_type
    field :units, String, null: true, method: :units
    field :incidents, String, null: true, method: :incidents
    field :remedy, String, null: true, method: :remedy
    field :sold_at_label, String, null: true, method: :sold_at_label
    field :sold_at, String, null: true, method: :sold_at
    field :importers, String, null: true, method: :importers
    field :manufacturers, String, null: true, method: :manufacturers
    field :distributors, String, null: true, method: :distributors
    field :manufactured_in, String, null: true, method: :manufactured_in
    field :custom_label, String, null: true, method: :custom_label
    field :custom_field, String, null: true, method: :custom_field
  end
end
