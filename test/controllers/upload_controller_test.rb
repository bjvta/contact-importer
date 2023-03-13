# frozen_string_literal: true

require 'test_helper'

describe UploadController do
  it 'must get index' do
    get upload_index_url
    must_respond_with :success
  end

  it 'must get import' do
    get upload_import_url
    must_respond_with :success
  end
end
