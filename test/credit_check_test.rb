require "./lib/credit_check"
require "minitest/autorun"
require "minitest/pride"
require "pry"

class CreditCheckTest < MiniTest::Test

  def test_it_exists
    credit_check = CreditCheck.new(1)

    assert_instance_of CreditCheck, credit_check
  end
  
end
