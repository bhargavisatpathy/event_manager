class Messages

  def welcome
    "Welcome to event reporter"
  end

  def tsv_header
    "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"
  end

  def csv_header
    ["last name","first name","email","zipcode","city","state","address","phone number"]
  end
end
