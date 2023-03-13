# frozen_string_literal: true

class RowImporter < ApplicationRecord
  has_many :row_attributes, inverse_of: :row_importer
  accepts_nested_attributes_for :row_attributes, reject_if: :all_blank, allow_destroy: true

  belongs_to :contact_importer_file
end
