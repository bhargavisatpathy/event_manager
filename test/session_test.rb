require_relative '../test/test_helper'
require_relative '../lib/session'

class SessionTest < Minitest::Test
  def test_file_load
    session = Session.new("./data/test_data.csv")
    session.load_file
    assert_equal 8, session.contents.length
  end

  def test_find_by_attribute_and_criteria
    session = Session.new("./data/test_data.csv")
    session.load_file
    session.find("first_name", "sarah")
    assert_equal 2, session.queue.length
  end

  def test_queue_clear_works
    session = Session.new("./data/test_data.csv")
    session.load_file
    session.find("first_name", "saraH")
    session.queue_clear
    assert_equal 0, session.queue.length
  end

  def test_save_to_csv_with_dummy_file
    session = Session.new("./data/test_data.csv")
    session.load_file
    session.find("first_name", "sarah")
    session.save_to_csv("test_output.csv")
    row_count = 0
    CSV.foreach("./data/test_output.csv", headers: true) { |i| row_count += 1 }
    assert_equal 2, row_count
  end

  def test_session_find_and_clear
    session = Session.new("./data/test_data.csv")
    session.load_file

    session.find(:first_name, "Aya")
    assert_equal 1, session.queue.count

    session.queue_clear
    session.find(:first_name, "SaraH")

    assert_equal 2, session.queue.count
  end

   def test_sorted_queue_to_tsv
     session = Session.new("./data/test_data.csv")   #this filename will change depending on where I am running the test from terminal. Need to use absolute path.
     session.load_file
     session.find("first_name", "Sarah")
     assert_equal "Hankins", session.sorted_queue_to_tsv("last_name").split(/(\t|\n)+/)[16]
   end


end
