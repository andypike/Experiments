require "command_dispatcher"
require "twitter_response"
require "twitter_api"

class Twatter
  attr_reader :api, :dispatcher

  def run()
    @dispatcher = CommandDispatcher.new self
    @api = TwitterAPI.new

    puts "***Welcome to Twatter***"
    puts "Use the 'help' command for a full list of commands"

    loop do
      print "Command: "
      command = gets.chomp

      process_command(command)
    end
  end

  def process_command (command)
    if(!@dispatcher.execute command)
      puts "'#{command}' is an invalid command, issue the help command for a list of valid commands."
    end
  end

end

application = Twatter.new
application.run