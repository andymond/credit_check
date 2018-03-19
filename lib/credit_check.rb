class CreditCheck
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def reverse_digits
    card_number.split("").reverse.map { |d| d.to_i }
  end

  def double_alternates
    reverse_digits.map.with_index do |d, i|
      d % 2 == 0 ? d * 2 : d
    end
  end

  def convert_to_single_digits
    double_alternates.map do |d|
      d > 9 ? d - 9 : d
    end
  end
end
