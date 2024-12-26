# frozen_string_literal: true

class Product < ActiveRecord::Base
  def self.searchable_fields
    %w[
      recall_number warning_number date warning_date recall_heading product_name
      description hazard_description consumer_action original_warning_announcement
      remedy_type units incidents remedy sold_at_label sold_at importers
      manufacturers distributors manufactured_in custom_label custom_field
    ]
  end
end
