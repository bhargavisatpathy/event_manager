require_relative '../test/test_helper'
require_relative '../lib/data_cleaner'

class DataCleanerTest < Minitest::Test
  def test_it_shows_zipcode_as_five_digits
    zipcode = " 382".to_i
    data_cleaner = DataCleaner.new
    new_zip = data_cleaner.clean_zipcode(zipcode)
    assert_equal new_zip, "00382"
  end

  def test_homephone_is_ten_digits
    homephone = "382 - 2687"
    data_cleaner = DataCleaner.new
    data_cleaner.clean_homephone(homephone)
    assert homephone.length == 10
  end

  def test_empty_states_returns_message
    state = nil
    data_cleaner = DataCleaner.new
    empty_state = data_cleaner.clean_state(state)
    assert_equal empty_state, "state not given"
  end

  def test_it_strips_states_down_to_two_letters
    state = " TX"
    data_cleaner = DataCleaner.new
    whitespaced_state = data_cleaner.clean_state(state)
    assert_equal whitespaced_state, "TX"
  end

  def test_empty_streets_give_back_error_message
    street = nil
    data_cleaner = DataCleaner.new
    empty_street = data_cleaner.clean_street(street)
    assert_equal empty_street, "street not given"
  end
end
