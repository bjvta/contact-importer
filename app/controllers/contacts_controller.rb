# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts.page params[:page]
  end
end
