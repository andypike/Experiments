class FriendsTimelineCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "friends_timeline"
    @help_text = "Lists the latest 20 tweets from you and your friends"
  end

  def execute(app)
    response = app.api.get "statuses/friends_timeline"
    
    if(response)
      puts "***Friends Timeline***"
      response.data.each do |tweet|
        puts "#{tweet['user']['screen_name']} => #{tweet['text']}" 
      end
    end
  end
end