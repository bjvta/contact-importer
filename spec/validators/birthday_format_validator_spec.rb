# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BirthdayFormatValidator do
  before do
    stub_const('Validatable', Class.new).class_eval do
      include ActiveModel::Validations
      attr_accessor :birthday

      validates :birthday, birthday_format: true
    end
  end

  subject { Validatable.new }

  context 'valid birthday' do
    it 'validate with format %Y%m%d' do
      subject.birthday = '20130303'
      expect(subject).to be_valid
    end

    it 'validate with format %F (Year-month-day)' do
      subject.birthday = '2013-03-03'
      expect(subject).to be_valid
    end
  end

  context 'invalid birthday' do
    it 'return error message' do
      subject.birthday = '2013/03/03'
      expect(subject).not_to be_valid
    end

    it 'return error message with not existing day' do
      subject.birthday = '2013-02-30'
      expect(subject).not_to be_valid
    end
  end
end
