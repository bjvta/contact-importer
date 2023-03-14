# frozen_string_literal: true

class NameFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if (attribute != :name) || value.nil?

    return true unless value.include? '-'

    record.errors.add(attribute, :invalid, message: I18n.t('errors.name_invalid_format'))
  end
end
