# frozen_string_literal: true

require 'csv'

class UploadController < ApplicationController
  def index; end

  def new
    @contact_importer_file = ContactImporterFile.new
    row_attribute = RowAttribute.new
    row_importer = RowImporter.new

    row_attribute.attr_type = 'Name'
    row_attribute.val = 'Brandon'

    row_importer.row_attributes.append(row_attribute)
    row_attribute = RowAttribute.new
    row_attribute.attr_type = 'Birth'
    row_attribute.val = '12/12/93'

    row_importer.row_attributes.append(row_attribute)
    row_attribute = RowAttribute.new
    row_attribute.attr_type = 'email'
    row_attribute.val = 'bjvtamayo78@gmail.com'

    row_importer.row_attributes.append(row_attribute)
    @contact_importer_file.row_importers.append(row_importer)
    row_importer = RowImporter.new
    @contact_importer_file.row_importers.append(row_importer)
  end

  def import
    myfile = params[:file]
    @rowarraydisp = []

    return unless params[:file].present?

    @rowarraydisp = CSV.read(myfile.path)
  end

  # def upload_params
  #   params.require(:contact_importer_file).permit(:file_name, row_importers_attributes: [:id, row_attributes_attributes: [:id, :attr_type, :val, :_destroy], :_destroy])
  # end
end
