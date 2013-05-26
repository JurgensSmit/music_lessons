# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    amount 1.5
    responseCode 1
    responseMessage "MyString"
    xref "MyString"
    amountReceived 1.5
    transactionID "MyString"
    cardNumberMask "MyString"
    cardTypeCode "MyString"
    cardType "MyString"
  end
end
