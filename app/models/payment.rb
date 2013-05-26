require 'net/http'
require 'uri'

class Payment < ActiveRecord::Base
  attr_accessible :amount, :amountReceived, :cardNumberMask, :cardType, :cardTypeCode, :responseCode, :responseMessage, :transactionID, :xref, :cardNumber,
  :cardCVV, :cardExpiryMonth, :cardExpiryYear
  attr_accessor :cardNumber, :cardCVV, :cardExpiryMonth, :cardExpiryYear

  validate :credit_card_api_access, :on => :create

end
