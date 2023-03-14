# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birthday) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:credit_card_network) }
    it { should validate_presence_of(:credit_card_last_for_digit) }
    it { should validate_presence_of(:email) }
  end
end
