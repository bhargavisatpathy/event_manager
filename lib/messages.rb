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

  def help
"\nTo load a file                               \t:load <filename>
To find a record                                :find <attribute> <criteria>
To check number of records of the find output   :queue count
To list out the output of find:                 :queue print
To print output sorted by an attribute          :queue print by <attribute>
To save the output in a csv file                :queue save to <filename>
To start a new search (clear the queue)         :queue clear"
  end

  def help_list(user_option)

    case user_option.downcase
    when "load"
      "To load a file: load <filename>"
    when "find"
      "To find a record: find <attribute> <criteria>"
    when "queue"
      "To list out the output of find: queue print
      To print output sorted by an attribute: queue print by <attribute>
      To start a new search (clear the queue): queue clear"
    when "save"
      "To save the output in a csv file: queue save to <filename.csv>"
    end
  end
end
