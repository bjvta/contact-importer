# frozen_string_literal: true

class ContactImporterFile < ApplicationRecord
  has_many :row_importers, inverse_of: :contact_importer_file
  accepts_nested_attributes_for :row_importers, reject_if: :all_blank, allow_destroy: true

  validates :file_name, presence: true
  belongs_to :user
  has_many :contacts

  enum status: { on_hold: 0, processing: 1, failed: 2, finished: 3 }
end
