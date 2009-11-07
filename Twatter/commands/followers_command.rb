class FollowersCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "followers"
    @help_text = "Lists up to 100 of your followers"
  end

  def execute(app)
    response = app.api.get "statuses/followers"

    if(response)
      puts "***Followers***"
      response.data.each do |follower|
        puts "#{follower['name']} (#{follower['followers_count']} followers) => #{follower['description']}"
      end
    end
  end
end