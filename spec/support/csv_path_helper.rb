# frozen_string_literal: true

module CsvPathHelper
  def build_path(name)
    "#{Rails.root}/spec/fixtures/files/#{name}"
  end
end
