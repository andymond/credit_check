require "./lib/credit_check"
require "pry"

user_input = ""

until user_input == "quit" do
  puts "Validate Number: (type quit to exit)"
  user_input = gets.chomp
  credit_check = CreditCheck.new(user_input)
  begin
    puts credit_check.validation
  rescue ArgumentError
    puts "Invalid CC# Format"
    next
  end
end
