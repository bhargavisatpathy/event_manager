private

  def load_process
    filename = command[4..-1].strip
    filename = "./data/event_attendees.csv" if filename.empty?
    @session = Session.new(filename)
    session.load_file
    outstream.puts messages.load_option(filename)
  end

  def print_by_process
    attribute = command.split[3]
    if attribute != nil
      outstream.puts session.sorted_queue_to_tsv(attribute)
    end
  end

  def find_process
    params = command.slice(5..-1).split(" and ")
    attribute_to_criteria = {}
    params.each do |param|
      attribute = param.split[0]
      criteria = param.split[1..-1].join(" ")
      attribute_to_criteria[attribute] = criteria
    end
    session.find(attribute_to_criteria)
    outstream.puts messages.queue_status(session.queue.length)
  end

  def add_process
    attribute = command.split[1]
    criteria = command.split[2..-1].join(" ")
    session.add(attribute, criteria)
    outstream.puts messages.queue_status(session.queue.length)
  end

  def subtract_process
    attribute = command.split[1]
    criteria = command.split[2..-1].join(" ")
    session.subtract(attribute, criteria)
    outstream.puts messages.queue_status(session.queue.length)
  end

  def save_process
    filename = command.split[3]
    if filename != nil
      session.save_to_csv(filename)
    end
  end

  def help_process
    user_option = command.split[1]
    if user_option !=nil
      outstream.puts  messages.help_list(user_option)
    else
      outstream.puts messages.help
    end
  end
