require_relative '../test/test_helper'
require_relative '../lib/entry'

class EntryTest < Minitest::Test
  def test_to_array
    data = { regdate: "11/12/08 10:47", first_name: "Allison", last_name: "Nguyen", email_address: "arannon@jumpstartlab.com", homephone: "6154385000", street: "3155 19th St NW", city: "Washington", state: "DC", zipcode: "20010"}
    entry = Entry.new(data)
    assert_equal ["Nguyen", "Allison", "arannon@jumpstartlab.com", "20010", "Washington", "DC", "3155 19th St NW", "6154385000"], entry.to_array
  end
end
