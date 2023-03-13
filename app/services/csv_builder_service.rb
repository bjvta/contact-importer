# frozen_string_literal: true

require 'csv'

module CsvBuilderService
  def self.call(file_path)
    csv_file = File.read(file_path)
    csv_data = CSV.parse(csv_file)

    contact_importer_file = ContactImporterFile.new
    csv_data.each do |row|
      row_importer = RowImporter.new
      return contact_importer_file if row.size == 1

      row.each do |data|
        row_attribute = RowAttribute.new
        row_attribute.val = data
        row_importer.row_attributes.append(row_attribute)
      end
      contact_importer_file.row_importers.append(row_importer)
    end
    contact_importer_file.file_name = File.basename(file_path)
    contact_importer_file
  end
end
