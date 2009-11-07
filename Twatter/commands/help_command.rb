class HelpCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "help"
    @help_text = "Displays this help list"
  end

  def execute(app)
    puts "Help - Commands List"
    puts "===================="

    app.dispatcher.commands.each do |command|
      puts "#{command.name} => #{command.help_text}"
    end
  end
end