class FavoritesCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "favorites"
    @help_text = "Lists the latest 20 tweets that you have marked as your favorite"
  end

  def execute(app)
    response = app.api.get "favorites"

    if(response)
      puts "***Favorites***"
      response.data.each do |tweet|
        puts "#{tweet['user']['screen_name']} => #{tweet['text']}"
      end
    end
  end
end