require_relative '../test/test_helper'
require_relative '../lib/session'

class SessionTest < Minitest::Test
  def test_file_load
    session = Session.new("./test_data.csv")
    session.load_file
    assert_equal 8, session.contents.length
  end

  def test_find_by_attribute_and_criteria
    session = Session.new("./test_data.csv")
    session.load_file
    session.find("first_name", "sarah")
    assert_equal 2, session.queue.length
  end

  def test_queue_empty
    session = Session.new("./test_data.csv")
    session.queue_clear
    assert_equal 0, session.queue.length
  end

  def test_save_to_csv
    session = Session.new("./test_data.csv")
    session.load_file
    session.find("first_name", "sarah")
    session.save_to_csv("test_output.csv")
    row_count = 0
    CSV.foreach("test_output.csv", headers: true) { |i| row_count += 1 }
    assert_equal 2, row_count
  end

end
