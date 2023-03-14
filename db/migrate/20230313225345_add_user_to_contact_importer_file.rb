# frozen_string_literal: true

class AddUserToContactImporterFile < ActiveRecord::Migration[6.1]
  def change
    add_reference :contact_importer_files, :user, null: false, foreign_key: true
  end
end
