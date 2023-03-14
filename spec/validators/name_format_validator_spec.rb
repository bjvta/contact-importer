# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NameFormatValidator do
  before do
    stub_const('Validatable', Class.new).class_eval do
      include ActiveModel::Validations
      attr_accessor :name

      validates :name, name_format: true
    end
  end

  subject { Validatable.new }

  it 'validate name with line in the name' do
    subject.name = 'Brandon Jason-Mr'
    expect(subject).not_to be_valid
  end

  it 'validate name without line in the name' do
    subject.name = 'Brandon Jason Mr'
    expect(subject).to be_valid
  end
end
