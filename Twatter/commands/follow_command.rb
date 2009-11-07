class FollowCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "follow"
    @help_text = "Allows you to follow a new friend"
  end

  def execute(app)
    print "User name to follow: @"
    screen_name = gets.chomp

    if(screen_name.length == 0)
      puts "You must enter a user name to follow"
      return
    end

    response = app.api.post "friendships/create", {"screen_name" => screen_name}
    friend = response.data

    if (response.status_code == 200)
      puts "You are now following #{friend['name']} (#{friend['followers_count']} followers) => #{friend['description']}"
    elsif (response.status_code == 403)
      puts "You are already following @#{screen_name}"      
    end
  end
end