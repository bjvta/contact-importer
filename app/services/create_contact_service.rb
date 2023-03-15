# frozen_string_literal: true

class CreateContactService
  attr_accessor :contact_hash, :logged_user, :contact

  def initialize(contact_hash, logged_user)
    @contact_hash = contact_hash
    @logged_user = logged_user
  end

  def call
    build_contact
    if contact_exists?
      return "Contact could not be saved. Contact with email #{contact.email} already exists in the contact list."
    end

    if contact.save
      "Contact has been saved. Name: #{contact.name}, Email: #{contact.email}"
    else
      "Contact could not be saved. #{contact.errors.full_messages.join('\n')}"
    end
  rescue StandardError => e
    "Contact could not be save, reason: #{e.message}"
  end

  def contact_exists?
    logged_user.contacts.where(email: contact.email).any?
  end

  def build_contact
    credit_card_number = contact_hash[:credit_card_number]
    if contact_hash[:credit_card_number].present?
      contact_hash[:credit_card_last_for_digit] = contact_hash[:credit_card_number].last(4)
      contact_hash[:credit_card_number] = CreditCardService.new(credit_card_number)
      contact_hash[:credit_card_network] = GetCardNetworkService.call(credit_card_number)
    end
    contact_hash[:user] = logged_user
    @contact = Contact.new(contact_hash)
  end
end
