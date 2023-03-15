require 'rails_helper'

RSpec.describe CreateContactImporterFileService do
  describe '.call' do
    it 'given a ContactImporterFile with 2 children, save it and save a log' do
      data = ''
      result = described_class.call(data)
      expect(result).to eq('')
    end
    it 'given a CIF with bad children, save the log'
    it 'given good and bad CIF, save the log'
  end
end