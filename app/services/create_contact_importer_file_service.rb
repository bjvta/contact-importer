# frozen_string_literal: true

class CreateContactImporterFileService
  def self.call(contact_importer_file)
    contact_importer_file = change_status(contact_importer_file, 1)
    contact_importer_file = save_data(contact_importer_file)
    change_status(contact_importer_file, nil)
  end

  def self.change_status(contact_importer_file, status)
    contact_importer_file.status = if status == 1
                                     status
                                   elsif contact_importer_file.contacts.empty?
                                     2
                                   else
                                     3
                                   end
    contact_importer_file.save
    contact_importer_file
  end

  def self.save_data(contact_importer_file)
    user = contact_importer_file.user
    log = ''
    contact_importer_file.row_importers.each_with_index do |row_importer, index|
      contact_hash = { contact_importer_file: contact_importer_file }
      row_importer.row_attributes.each do |row|
        contact_hash[row.attr_type.to_sym] = row.val
      end
      log_saving_contact = CreateContactService.new(contact_hash, user).call
      log += "#{index + 1}: #{log_saving_contact}<br>"
    end
    contact_importer_file.log = log
    contact_importer_file.save
    contact_importer_file
  end
end
