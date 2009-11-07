class TweetCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "tweet"
    @help_text = "Send a new tweet to share with the world upto a maximum of 140 characters"
  end

  def execute(app)
    print "Your tweet: "
    tweet = gets.chomp

    if(tweet.length > 140)
      puts "This tweet is too long. It is #{tweet.length} long but it must be 140 or less"
      return
    end

    response = app.api.post "statuses/update", {"status" => tweet}
    if (response.status_code == 200)
      puts "Tweet sent successfully"
    end
  end
end