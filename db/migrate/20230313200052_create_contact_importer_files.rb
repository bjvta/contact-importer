# frozen_string_literal: true

class CreateContactImporterFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_importer_files do |t|
      t.string :file_name
      t.integer :status, default: 0
      t.text :log

      t.timestamps
    end
  end
end
