require_relative '../test/test_helper'
require_relative '../lib/cli'

class CLITest < Minitest::Test
  attr_reader :cli

  def setup
    @cli = CLI.new(nil, nil)  #now happens before every test
    @session = Session.new("some_attendees.csv")
  end

  def test_it_exists
    assert_instance_of CLI, cli
  end

  def test_prints_queue
    cli = CLI.new(nil,nil)
    cli.stub "command", "load" do
    refute cli.print?
    refute cli.quit?
    assert cli.load?
    end
  end

  def test_prints_queue
    cli = CLI.new(nil,nil)
    cli.stub "command", "queue print" do
    assert cli.print?
    refute cli.quit?
    refute cli.load?
    end
  end

  def test_get_help
    cli = CLI.new(nil,nil)
    cli.stub "command",'help' do
    assert cli.help?
    refute cli.save?
    refute cli.count?
    end
  end

  def test_it_quits_when_asked
    cli = CLI.new(nil,nil)
    cli.stub "command",'quit' do
    assert cli.quit?
    refute cli.clear?
    refute cli.find?
    end
  end

  def test_it_clears
    cli = CLI.new(nil,nil)
    cli.stub "command","queue clear" do
    assert cli.clear?
    refute cli.print?
    refute cli.find?
    end
  end

  def test_it_counts
    cli = CLI.new(nil,nil)
    cli.stub "command","queue count" do
    assert cli.count?
    refute cli.print?
    refute cli.find?
    end
  end

  def test_it_saves
    cli = CLI.new(nil,nil)
    cli.stub "command","queue save to" do
    assert cli.save?
    end
  end

end
