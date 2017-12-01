card_number = "342804633855673"
digits = card_number.reverse.split("")


def alternate_doubler(digits)
  doubled_digits = []
  digits.each_with_index do |digit, index|
    if index.odd?
      doubled_digits << digit.to_i * 2
    else
      doubled_digits << digit.to_i
    end
  end
  doubled_digits
end
#p doubled_digits

def double_digit_converter(digits)
  single_digits = alternate_doubler(digits).map do |digit| #probably better to pass output of alternate_doubler to converter
    if digit > 9
      digit - 9
    else
      digit
    end
  end
  p single_digits
end

final = double_digit_converter(digits)
#sum = 0
#single_digits.each do |digit|
#  sum += digit
#end

sum = final.inject(:+)
p sum


if sum % 10 == 0
 p "The number is valid!"
else
 p "The number is invalid!"
end
