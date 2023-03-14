class NameFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if attribute != :name or value.nil?
      
    if value.include? '-'
      record.errors.add(attribute, :invalid, message: I18n.t('errors.name_invalid_format'))
    else
      return true
    end
  end
end