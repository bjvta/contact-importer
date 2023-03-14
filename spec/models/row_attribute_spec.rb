require 'rails_helper'

RSpec.describe RowAttribute, type: :model do
  describe 'associations' do
    it { should belong_to(:row_importer) }
  end
end