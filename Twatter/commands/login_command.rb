class LoginCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "login"
    @help_text = "Prompts you for your Twitter user name and password. If valid, these are cached for other commands"
  end

  def execute(app)
    print "User Name: "
    user_name = gets.chomp

    print "Password: "
    password = gets.chomp

    response = app.api.get "account/verify_credentials", user_name, password

    if (response.status_code == 200)
        app.api.cache_credentials user_name, password
        puts "Login successful - Hello #{response.data["name"]}, you currently have #{response.data["followers_count"]} followers."
    end

  end
end