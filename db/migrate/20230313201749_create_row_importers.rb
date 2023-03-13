# frozen_string_literal: true

class CreateRowImporters < ActiveRecord::Migration[6.1]
  def change
    create_table :row_importers do |t|
      t.belongs_to :contact_importer_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
