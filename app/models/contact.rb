# frozen_string_literal: true

class Contact < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :contact_importer_file

  validates :name, presence: true, name_format: true
  validates :birthday, presence: true, birthday_format: true
  validates :phone, presence: true, phone_number_format: true
  validates :credit_card_number, presence: true
  validates :credit_card_network, presence: true
  validates :credit_card_last_for_digit, presence: true
  validates :email, presence: true
end
