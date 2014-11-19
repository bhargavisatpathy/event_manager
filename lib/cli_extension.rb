private

def load_process
  filename = @command[4..-1].strip
  filename = "event_attendees.csv" if filename.empty?
  @session = Session.new(filename)
  session.load_file
  outstream.puts messages.load_option(filename)
end

def print_by_process
  attribute = @command.split(" ")[3]
  if attribute != nil
    outstream.puts session.sorted_queue_to_tsv(attribute)
  end
end

def find_process
  attribute = @command.split(" ")[1]
  criteria = @command.split(" ")[2] if @command.split(" ")[3] == nil
  criteria = @command.split[2..-1].join(" ") if @command.split(" ")[3] != nil
  if attribute != nil && criteria != nil
    session.find(attribute, criteria)
  end
  outstream.puts messages.records_found(session.queue.length)
end

def save_process
  filename = @command.split(" ")[3]
  if filename != nil
    session.save_to_csv(filename)
  end
end

def help_process
  user_option = @command.split(" ")[1]
  if user_option !=nil
    outstream.puts  messages.help_list(user_option)
  else
    outstream.puts messages.help
  end
end
