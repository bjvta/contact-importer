require 'rails_helper'

RSpec.describe CreditCardService do
  describe '#decrypt' do
    it 'should work' do
      data = 'nkAjl+a3yTNGvI+G24A29k7G--Rn68LnmCH42zjX7a--JhOynoR3aThK04cFETDAEQ=='
      result = described_class.new(data).decrypt
      expect(result).to eq('password')
    end
  end
end