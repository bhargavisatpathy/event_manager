class Entry

  attr_reader :last_name, :first_name, :email_address, :zipcode, :city, :state, :street, :home_phone
  def initialize(data)
    @id             = data[0]
    @reg_date       = data[:regdate]
    @first_name     = data[:first_name]
    @last_name      = data[:last_name]
    @email_address  = data[:email_address]
    @home_phone     = data[:homephone]
    @street         = data[:street]
    @state          = data[:state]
    @city           = data[:city]
    @zipcode        = data[:zipcode]
  end

  def to_array
    #"LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
    [last_name, first_name, email_address, zipcode, city, state, street, home_phone]
  end
end
