module GetCardNetworkService
  AMERICAN_EXPRESS_REGEX = /^3[47][0-9]{13}$/
  DINNERS_CLUB_REGEX = /^3[47][0-9]{13}$/

  AMERICAN_EXPRESS = 'American Express'
  DINNERS_CLUB = 'Dinners Club'

  def self.call card_number
    card_number = card_number.strip
    if card_number.match AMERICAN_EXPRESS_REGEX
      return AMERICAN_EXPRESS
    end
    if card_number.match DINNERS_CLUB_REGEX
      return DINNERS_CLUB
    end
  end
end