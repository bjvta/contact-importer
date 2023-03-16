# frozen_string_literal: true

require 'csv'

class UploadController < ApplicationController
  def index
    @contact_importer_files = current_user.contact_importer_files
  end

  def show
    @contact_importer_file = current_user.contact_importer_files.find(params[:id])
  end

  def new; end

  def import
    myfile = params[:file]
    return unless params[:file].present?

    @contact_importer_file = CsvBuilderService.call(myfile.path)
    @contact_importer_file.user = current_user
    @contact_importer_file.save
    return unless @contact_importer_file.row_importers.empty?

    @contact_importer_file.file_name = File.basename(myfile.path)
    @contact_importer_file.status = 2
    @contact_importer_file.log = 'The file is empty'
    @contact_importer_file.save
    redirect_to upload_show_path(id: @contact_importer_file)
  end

  def save
    contact_importer_file = ContactImporterFile.find(params[:contact_importer_file][:id])
    contact_importer_file.update(upload_params)
    contact_importer_result = CreateContactImporterFileService.call(contact_importer_file)
    redirect_to upload_show_path(id: contact_importer_result), notice: 'Contact was imported, check the log'
  end

  def upload_params
    params.require(:contact_importer_file).permit(:id,
                                                  :file_name,
                                                  row_importers_attributes: [
                                                    :id,
                                                    :_destroy,
                                                    { row_attributes_attributes: %i[
                                                      id
                                                      attr_type
                                                      val
                                                      _destroy
                                                    ] }
                                                  ])
  end
end
