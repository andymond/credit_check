class CreditCheck
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def verify_card_number
    if card_number =~ /^-?[0-9]+$/ && card_number.length.between?(8, 19)
      card_number
    else
      raise ArgumentError.new("Invalid CC# Format")
    end
  end

  def reverse_digits
    verify_card_number.split("").reverse.map { |d| d.to_i }
  end

  def double_alternates
    reverse_digits.map.with_index do |d, i|
      i.odd? ? d * 2 : d
    end
  end

  def convert_to_single_digits
    double_alternates.map do |d|
      d > 9 ? d - 9 : d
    end
  end

  def validation
    if convert_to_single_digits.sum % 10 == 0
      print "Valid Card Number"
    else
      print "Invalid Card Number"
    end
  end
end
