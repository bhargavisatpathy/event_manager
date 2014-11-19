require 'csv'
require_relative 'session'
require_relative 'cli_extension'

class CLI
  attr_reader :command, :messages, :instream, :outstream, :session
  attr_accessor :command
  def initialize(instream, outstream)
    @messages  = Messages.new
    @instream  = instream
    @outstream = outstream
    @session   = Session.new("")
    @command   = ""
  end

  def call
    outstream.puts messages.welcome
    until quit?
      @command = instream.gets.strip
      process_commands
    end
  end

  def process_commands
    case
      when load?                  then load_process
      when print?                 then outstream.puts session.queue_to_tsv
      when print_by?              then print_by_process
      when count?                 then outstream.puts session.queue.length
      when clear?                 then outstream.puts session.queue_clear
      when find?                  then find_process
      when save?                  then save_process
      when help?                  then help_process
    else
      if !quit?
        outstream.puts messages.invalid_command
      end
    end
  end

  def load?
    command.downcase.start_with?("load")
  end

  def print?
    command.strip.downcase == "queue print"
  end

  def print_by?
    command.downcase.start_with?("queue print by")
  end

  def count?
    command.strip.downcase == "queue count"
  end

  def clear?
    command.strip.downcase == "queue clear"
  end

  def find?
    command.downcase.start_with?("find")
  end

  def save?
    command.downcase.start_with?("queue save to")
  end

  def quit?
    command.downcase == "quit"
  end

  def help?
    command.downcase.start_with?("help")
  end


end
