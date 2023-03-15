require 'rails_helper'

RSpec.describe CreateContactService do
  describe '#call' do
    let!(:logged_user) { create(:user) }
    context 'valid data' do
      it 'given a right hash with attributes, should return a string with data saved' do
        hash_data = {
          name: 'Brandon Valle',
          birthday: '19921204',
          phone: '(+57) 320 432 05 09',
          address: 'This is the address',
          credit_card_number: '6011111111111117',
          email: 'bjvtamayo78@gmail.com'
        }
        result = described_class.new(hash_data, logged_user).call
        expect(result).to eq('Contact has been saved. Name: Brandon Valle, Email: bjvtamayo78@gmail.com')
      end
    end
    context 'invalid data' do
      it 'given a bad hash, should return a string with errors' do
        hash_data = {
          name: 'Brandon-Valle',
          birthday: '19921204',
          phone: '(+57) 320 432 05 09',
          address: 'This is the address',
          credit_card_number: '6011111111111117',
          email: 'bjvtamayo78@gmail.com'
        }
        result = described_class.new(hash_data, logged_user).call
        expect(result).to eq('Contact could not be saved. Name has an invalid format')
      end

      it 'given an existing email with the same user' do
        contact = create(:contact, user: logged_user)
        hash_data = {
          name: 'Brandon Valle',
          birthday: '19921204',
          phone: '(+57) 320 432 05 09',
          address: 'This is the address',
          credit_card_number: '6011111111111117',
          email: contact.email
        }
        result = described_class.new(hash_data, logged_user).call
        expect(result).to eq("Contact could not be saved. Contact with email #{contact.email} already exists in the contact list.")
      end
    end
  end
end