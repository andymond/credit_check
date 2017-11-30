card_number = "4929735477250543"
valid = false #sets default

#Luhn algorithm
digits = card_number.reverse.split("")

doubled_digits = []
digits.each_with_index do |digit, index|
  if index.odd?
    doubled_digits << digit.to_i * 2
  else
    doubled_digits << digit.to_i
  end
end

#p doubled_digits

single_digits = doubled_digits.map do |digit|
  if digit > 9
    digit - 9
  else
    digit
  end
end

p single_digits

#sum = 0
#single_digits.each do |digit|
#  sum += digit
#end
sum = single_digits.inject(:+)
p sum

if sum % 10 == 0
 p "The number is valid!"
else
 p "The number is invalid!"
end
