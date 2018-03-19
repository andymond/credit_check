require "./lib/credit_check"
require "minitest/autorun"
require "minitest/pride"
require "pry"

class CreditCheckTest < MiniTest::Test

  def test_it_exists
    credit_check = CreditCheck.new("123456778")

    assert_instance_of CreditCheck, credit_check
  end

  def test_it_converts_string_to_reverse_digits
    credit_check = CreditCheck.new("123456789")

    digits = [9, 8, 7, 6, 5, 4, 3, 2, 1]

    assert_equal digits, credit_check.reverse_digits
  end

  def test_it_doubles_every_other_digit
    credit_check = CreditCheck.new("123456789")

    digits = [9, 16, 7, 12, 5, 8, 3, 4, 1]

    assert_equal digits, credit_check.double_alternates
  end

  def test_it_converts_double_to_single_digits
    credit_check = CreditCheck.new("123456789")

    digits = [9, 7, 7, 3, 5, 8, 3, 4, 1]

    assert_equal digits, credit_check.convert_to_single_digits
  end

  def test_it_validates_numbers
    credit_check = CreditCheck.new("123456789")

    assert_output("Invalid Card Number") { credit_check.validation }

    credit_check = CreditCheck.new("342804633855673")

    assert_output("Valid Card Number") { credit_check.validation }
  end

  def test_raises_error_for_bad_input
    credit_check = CreditCheck.new("Word")

    assert_raises ArgumentError do
      credit_check.verify_card_number
    end
  end



end
