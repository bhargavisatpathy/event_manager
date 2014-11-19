class DataCleaner

  def clean_homephone(number)
    number.gsub(/[^0-9]/, "").ljust(10, "0")[0..9]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_state(state)
    if state == nil || state == ""
      "Nil"
    else
      state.strip[0..1]
    end
  end


  def clean_city(city)
    if city == nil || city == ""
      "Nil"
    else
      city.downcase#.gsub(/\s+/,"")
    end
  end

  def clean_street(street)
    if street == nil || street == ""
      "Nil"
    else
      street.strip
    end
  end
end
