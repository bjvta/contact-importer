# frozen_string_literal: true

class BirthdayFormatValidator < ActiveModel::EachValidator
  DATE_FORMAT_F = /^([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$/.freeze
  DATE_FORMAT_YMD = /^([12]\d{3}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01]))$/.freeze

  def validate_each(record, attribute, value)
    return if (attribute != :birthday) || value.nil?

    unless value.match(DATE_FORMAT_F) || value.match(DATE_FORMAT_YMD)
      record.errors.add(attribute, :invalid, message: I18n.t('errors.birthday_invalid_format'))
    end

    begin
      # This will parse if the date is invalid, example Feb 30
      d = Date.parse(value)
    rescue StandardError
      record.errors.add(attribute, :invalid, message: I18n.t('errors.birthday_invalid_date'))
    end
  end
end
