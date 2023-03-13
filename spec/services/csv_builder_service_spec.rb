# frozen_string_literal: true

require 'rails_helper'
require './spec/support/csv_path_helper'

RSpec.configure do |c|
  c.include CsvPathHelper
end

RSpec.describe CsvBuilderService do
  describe '.call' do
    it 'should return a ContactImporterFile object with one child' do
      csv_path = build_path('test0.csv')
      builder = CsvBuilderService.call csv_path
      first_row_importer = builder.row_importers.first
      expect(builder).to be_kind_of ContactImporterFile
      expect(builder.row_importers.size).to eq(0)
    end

    it 'should return a ContactImporterFile object with one child' do
      csv_path = build_path('test1.csv')
      builder = CsvBuilderService.call csv_path
      first_row_importer = builder.row_importers.first
      expect(builder).to be_kind_of ContactImporterFile
      expect(builder.row_importers.size).to eq(1)
      expect(first_row_importer.row_attributes.size).to eq(6)
    end

    it 'should return a ContactImporterFile object with 2 child' do
      csv_path = build_path('test2.csv')
      builder = CsvBuilderService.call csv_path
      expect(builder).to be_kind_of ContactImporterFile
      expect(builder.row_importers.size).to eq(2)
    end

    it 'should return a ContactImporterFile object with 3 children' do
      csv_path = build_path('test3.csv')
      builder = CsvBuilderService.call csv_path
      expect(builder).to be_kind_of ContactImporterFile
      expect(builder.row_importers.size).to eq(3)
    end

    it 'should return a ContactImporterFile object with 42 children' do
      csv_path = build_path('test4.csv')
      builder = CsvBuilderService.call csv_path
      expect(builder).to be_kind_of ContactImporterFile
      expect(builder.row_importers.size).to eq(42)
    end
  end
end
