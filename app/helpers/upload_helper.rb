# frozen_string_literal: true

module UploadHelper
  def attribute_type_selector
    [['Name', 'name'], ['Date of Birth', 'birth'], ['Phone', 'phone'], ['Address', 'address'],
     ['Credit Card Number', 'card_number'], ['Email', 'email']]
  end
end
