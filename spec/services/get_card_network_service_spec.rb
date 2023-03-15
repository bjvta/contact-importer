# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GetCardNetworkService do
  describe '.call' do
    context 'valid card numbers' do
      it 'must return American Express card network' do
        card_number = '371449635398431'
        result = described_class.call(card_number)
        expect(result).to eq('American Express')
      end

      it 'must return Diners Club card network' do
        card_number = '30569309025904'
        result = described_class.call(card_number)
        expect(result).to eq('Diners Club')
      end

      it 'must return Discover card network' do
        card_number = '6011111111111117'
        result = described_class.call(card_number)
        expect(result).to eq('Discover')
      end

      it 'must return JCB card network' do
        card_number = '3530111333300000'
        result = described_class.call(card_number)
        expect(result).to eq('JCB')
      end

      it 'must return MasterCard card network' do
        card_number = '5555555555554444'
        result = described_class.call(card_number)
        expect(result).to eq('MasterCard')
      end

      it 'must return Visa card network' do
        card_number = '4111111111111111'
        result = described_class.call(card_number)
        expect(result).to eq('Visa')
      end

      it 'must return Visa with spaces' do
        card_number = '4111 1111 1111 1111'
        result = described_class.call(card_number)
        expect(result).to eq('Visa')
      end
    end

    context 'invalid card numbers' do
      it 'must return invalid' do
        card_number = '4111 111 111 111'
        result = described_class.call(card_number)
        expect(result).to eq('Invalid Card Number')
      end
    end
  end
end
