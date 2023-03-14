# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RowImporter, type: :model do
  describe 'associations' do
    it { should belong_to(:contact_importer_file) }
    it { should have_many(:row_attributes) }
  end
end
