class FollowingCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "following"
    @help_text = "Lists up to 100 friends that you are followering"
  end

  def execute(app)
    response = app.api.get "statuses/friends"

    if(response)
      puts "***Following***"
      response.data.each do |friend|
        puts "#{friend['name']} (#{friend['followers_count']} followers) => #{friend['description']}"
      end
    end
  end
end