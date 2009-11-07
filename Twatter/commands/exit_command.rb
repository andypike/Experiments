class ExitCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "exit"
    @help_text = "Exits the application"
  end

  def execute(app)
    print "Are you sure you want to exit (y/n)?"
    is_sure = gets.chomp

    if is_sure == "y"
      exit
    end
  end            
end