# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactImporterFile, type: :model do
  describe 'associations' do
    it { should have_many(:row_importers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:file_name) }
  end
end
