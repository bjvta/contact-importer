# frozen_string_literal: true

class CreateContactImporterFileService
  def self.call(contact_importer_file)
    log = ''
    user = contact_importer_file.user
    contact_importer_file.row_importers.each_with_index do |row_importer, index|
      contact_hash = {}
      row_importer.row_attributes.each do |row|
        contact_hash[row.attr_type.to_sym] = row.val
      end
      log_saving_contact = CreateContactService.new(contact_hash, user).call
      log += "#{index + 1}: #{log_saving_contact}\n"
    end
    contact_importer_file.log = log
    contact_importer_file.save
    contact_importer_file
  end
end
