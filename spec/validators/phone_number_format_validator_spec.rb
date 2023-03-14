# \((?:\+\d{2})\)\s\d{3}[- ]?\d{3}[- ]?\d{2}[- ]?\d{2}

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumberFormatValidator do
  before do
    stub_const('Validatable', Class.new).class_eval do
      include ActiveModel::Validations
      attr_accessor :phone

      validates :phone, phone_number_format: true
    end
  end

  subject { Validatable.new }

  context 'valid phone numbers' do
    it 'should work with spaces' do
      subject.phone = '(+57) 320 432 05 09'
      expect(subject).to be_valid
    end

    it 'should work with lines' do
      subject.phone = '(+57) 320-432-05-09'
      expect(subject).to be_valid
    end
  end

  context 'invalid phone numbers' do
    it 'should not work without spaces' do
      subject.phone = '(+57)3204320509'
      expect(subject).not_to be_valid
    end

    it 'should not work with a Bolivian number' do
      subject.phone = '(+591) 60901586'
      expect(subject).not_to be_valid
    end
  end
end
