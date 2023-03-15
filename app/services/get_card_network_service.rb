module GetCardNetworkService
  AMERICAN_EXPRESS_REGEX = /^3[47][0-9]{13}$/
  DINERS_CLUB_REGEX = /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/
  DISCOVER_REGEX = /^6(?:011|5[0-9]{2})[0-9]{12}$/
  JCB_REGEX = /^(?:2131|1800|35[0-9]{3})[0-9]{11}$/
  MASTER_CARD_REGEX = /^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$/
  VISA_REGEX = /^4[0-9]{12}(?:[0-9]{3})$/

  AMERICAN_EXPRESS = 'American Express'
  DINERS_CLUB = 'Diners Club'
  DISCOVER = 'Discover'
  JCB = 'JCB'
  MASTER_CARD = 'MasterCard'
  VISA = 'Visa'

  def self.call card_number
    card_number = card_number.gsub(' ', '')
    return AMERICAN_EXPRESS if card_number.match AMERICAN_EXPRESS_REGEX
    return DINERS_CLUB if card_number.match DINERS_CLUB_REGEX
    return DISCOVER if card_number.match DISCOVER_REGEX
    return JCB if card_number.match JCB_REGEX
    return MASTER_CARD if card_number.match MASTER_CARD_REGEX
    return VISA if card_number.match VISA_REGEX

    'Invalid Card Number'
  end
end
