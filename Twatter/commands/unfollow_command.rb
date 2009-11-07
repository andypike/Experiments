class UnfollowCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "unfollow"
    @help_text = "Allows you to stop following a friend"
  end

  def execute(app)
    print "User name to unfollow: @"
    screen_name = gets.chomp

    if(screen_name.length == 0)
      puts "You must enter a user name to unfollow"
      return
    end

    response = app.api.post "friendships/destroy", {"screen_name" => screen_name}
    friend = response.data

    if (response.status_code == 200)
      puts "You have unfollowed #{friend['name']} (#{friend['followers_count']} followers) => #{friend['description']}"
    end
  end
end