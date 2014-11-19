class DataCleaner

  def clean_homephone(number)
    number.gsub(/[^0-9]/, "").ljust(10, "0")[0..9]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_state(state)
    state == nil || state == "" ? "Nil" : state.strip[0..1]
  end


  def clean_city(city)
    city == nil || city == "" ? "Nil" : city.downcase
  end

  def clean_street(street)
    street == nil || street == "" ? "Nil" : street.strip
  end
end
