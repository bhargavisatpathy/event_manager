class Messages

  def welcome
    "\nInitializing Event Reporter\n" + help
  end

  def invalid_command
    "Please enter valid command\n"
  end

  def load_option(filename)
    "File #{filename} loaded\n\n"
  end

  def queue_status(length)
    "Queue length = #{length}. Use 'queue print' to see them.\n\n"
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
To use extended find                            :find <attribute> <criteria> [and <attribute> <criteria>]
To check number of records of the find output   :queue count
To list out the output of find:                 :queue print
To print output sorted by an attribute          :queue print by <attribute>
To save the output in a csv file                :queue save to <filename>
To start a new search (clear the queue)         :queue clear
To add more records to the queue                :add <attribute> <criteria>
To remove records from the queue                :subtract <attribute> <criteria>
\n"
  end

  def help_list(user_option)

    case user_option.downcase
      when "load"                                 then "To load a file: load <filename>\n"
      when "find"                                 then "To find a record: find <attribute> <criteria> [and <attribute> <criteria>]\n"
      when "queue"                                then "To list out the output of find: queue print.\nTo print output sorted by an attribute: queue print by <attribute>.\nTo start a new search (clear the queue): queue clear.\nTo check number of records in queue: queue count.\n\n"
      when "save"                                 then "To save the output in a csv file: queue save to <filename.csv>\n"
      when "add"                                  then "To add records to the queue: add <attribute> <criteria>\n"
      when "subtract"                             then "To remove records from the queue: subtract <attribute> <criteria>\n"
    end
  end
end
