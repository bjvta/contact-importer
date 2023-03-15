# frozen_string_literal: true

class EmailFormatValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.freeze

  def validate_each(record, attribute, value)
    return if (attribute != :email) || value.nil?

    return if value.match EMAIL_REGEX

    record.errors.add(attribute, :invalid, message: I18n.t('errors.email_invalid_format'))
  end
end
