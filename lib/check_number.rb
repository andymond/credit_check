require "./lib/credit_check"
require "pry"

class CheckNumber

  def initialize
    @user_input = ""
  end

  def check
    until @user_input == "quit" do
      puts "( type quit to exit )"
      get_input
      analyze(@user_input) unless @user_input == "quit"
    end
  end

  def get_input
    print "Validate Number: "
    @user_input = gets.chomp
  end

  def analyze(input)
    credit_check = CreditCheck.new(@user_input)
    begin
      puts credit_check.validation
    rescue ArgumentError
      puts "Invalid CC# Format"
    end
  end
end

session = CheckNumber.new
session.check
