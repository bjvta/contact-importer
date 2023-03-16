# frozen_string_literal: true

class AddContactImporterFileToContact < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :contact_importer_file, null: false, foreign_key: true
  end
end
