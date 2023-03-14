# frozen_string_literal: true

class PhoneNumberFormatValidator < ActiveModel::EachValidator
  PHONE_FORMAT = /^\((?:\+\d{2})\)\s\d{3}[- ]?\d{3}[- ]?\d{2}[- ]?\d{2}$/.freeze

  def validate_each(record, attribute, value)
    return if (attribute != :phone) || value.nil?

    unless value.match(PHONE_FORMAT)
      record.errors.add(attribute, :invalid, message: I18n.t('errors.phone_invalid_format'))
    end
    true
  end
end
