# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailFormatValidator do
  before do
    stub_const('Validatable', Class.new).class_eval do
      include ActiveModel::Validations
      attr_accessor :email

      validates :email, email_format: true
    end
  end

  subject { Validatable.new }

  it 'validate email with a normal email' do
    subject.email = 'bjvtamayo78@gmail.com'
    expect(subject).to be_valid
  end

  it 'validate email without an incorrect email' do
    subject.email = 'bv@.com'
    expect(subject).not_to be_valid
  end
end

