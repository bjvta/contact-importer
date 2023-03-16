# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateContactImporterFileService do
  describe '.call' do
    let!(:row_attribute_name) { build(:row_attribute, attr_type: 'name', val: 'Brandon Valle') }
    let!(:row_attribute_birthday) { build(:row_attribute, attr_type: 'birthday', val: '19921204') }
    let!(:row_attribute_phone) { build(:row_attribute, attr_type: 'phone', val: '(+57) 320-432-05-09') }
    let!(:row_attribute_address) { build(:row_attribute, attr_type: 'address', val: 'Barrio Cañada del Carmen') }
    let!(:row_attribute_credit_card) { build(:row_attribute, attr_type: 'credit_card_number', val: '371449635398431') }
    let!(:row_attribute_email) { build(:row_attribute, attr_type: 'email', val: 'bjvtamayo78@gmail.com') }
    let!(:row_attribute_email_two) { build(:row_attribute, attr_type: 'email', val: 'brandon@bjvta.com') }
    let!(:row_importer) { build(:row_importer) }
    let!(:row_importer_two) { build(:row_importer) }
    let!(:contact_importer_file) { build(:contact_importer_file) }

    it 'given a ContactImporterFile with 2 children, save it and save a log' do
      row_importer.row_attributes.append(row_attribute_name)
      row_importer.row_attributes.append(row_attribute_birthday)
      row_importer.row_attributes.append(row_attribute_phone)
      row_importer.row_attributes.append(row_attribute_address)
      row_importer.row_attributes.append(row_attribute_credit_card)
      row_importer.row_attributes.append(row_attribute_email)
      contact_importer_file.row_importers.append(row_importer)

      expect do
        result = described_class.call(contact_importer_file)
        expect(result.contacts.size).to eq(1)
      end.to change { Contact.count }.by(1)
    end

    it 'given a CIF with bad children, no email, save the log' do
      row_importer.row_attributes.append(row_attribute_name)
      row_importer.row_attributes.append(row_attribute_birthday)
      row_importer.row_attributes.append(row_attribute_phone)
      row_importer.row_attributes.append(row_attribute_address)
      row_importer.row_attributes.append(row_attribute_credit_card)
      contact_importer_file.row_importers.append(row_importer)

      expect do
        result = described_class.call(contact_importer_file)
        expect(result.log).not_to eq('')
      end.to change { Contact.count }.by(0)
    end

    it 'given a CIF with no credit card, save the log' do
      row_importer.row_attributes.append(row_attribute_name)
      row_importer.row_attributes.append(row_attribute_birthday)
      row_importer.row_attributes.append(row_attribute_phone)
      row_importer.row_attributes.append(row_attribute_address)
      row_importer.row_attributes.append(row_attribute_email)
      contact_importer_file.row_importers.append(row_importer)

      expect do
        result = described_class.call(contact_importer_file)
        expect(result.log).not_to eq('')
      end.to change { Contact.count }.by(0)
    end

    it 'given good and bad CIF, save the log' do
      row_importer.row_attributes.append(row_attribute_name)
      row_importer.row_attributes.append(row_attribute_birthday)
      row_importer.row_attributes.append(row_attribute_phone)
      row_importer.row_attributes.append(row_attribute_address)
      row_importer.row_attributes.append(row_attribute_credit_card)
      row_importer.row_attributes.append(row_attribute_email)
      contact_importer_file.row_importers.append(row_importer)

      row_importer_two.row_attributes.append(row_attribute_name)
      row_importer_two.row_attributes.append(row_attribute_birthday)
      row_importer_two.row_attributes.append(row_attribute_phone)
      row_importer_two.row_attributes.append(row_attribute_address)
      row_importer_two.row_attributes.append(row_attribute_credit_card)
      contact_importer_file.row_importers.append(row_importer_two)
      expect do
        result = described_class.call(contact_importer_file)
        expect(result.log).not_to eq('')
      end.to change { Contact.count }.by(1)
    end

    it 'given an existing email on the contact list' do
      logged_user = create(:user)
      contact = create(:contact, user: logged_user, email: row_attribute_email.val)
      contact_importer_file = create(:contact_importer_file, user: logged_user)
      row_importer.row_attributes.append(row_attribute_name)
      row_importer.row_attributes.append(row_attribute_birthday)
      row_importer.row_attributes.append(row_attribute_phone)
      row_importer.row_attributes.append(row_attribute_address)
      row_importer.row_attributes.append(row_attribute_credit_card)
      row_importer.row_attributes.append(row_attribute_email)
      contact_importer_file.row_importers.append(row_importer)
      expect do
        result = described_class.call(contact_importer_file)
        expect(result.log).not_to eq('')
      end.to change { Contact.count }.by(0)
    end
  end
end
