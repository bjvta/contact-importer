# frozen_string_literal: true

class CreditCardService
  attr_accessor :data, :crypt

  KEY = ENV['KEY_SECRET']

  def initialize(data)
    @data = data
    local_key = [KEY].pack('H*')
    @crypt = ActiveSupport::MessageEncryptor.new(local_key)
  end

  def encrypt
    crypt.encrypt_and_sign(data)
  end

  def decrypt
    crypt.decrypt_and_verify(data)
  end
end
