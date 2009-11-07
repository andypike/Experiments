class MentionsCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "mentions"
    @help_text = "Lists the latest 20 tweets that contain your user name"
  end

  def execute(app)
    response = app.api.get "statuses/mentions"

    if(response)
      puts "***Mentions Timeline***"
      response.data.each do |tweet|
        puts "#{tweet['user']['screen_name']} => #{tweet['text']}"
      end
    end
  end
end