class DirectMessagesCommand
  attr_reader :name, :help_text

  def initialize()
    @name = "dms"
    @help_text = "Lists the latest 20 direct messages sent to you"
  end

  def execute(app)
    response = app.api.get "direct_messages"

    if(response)
      puts "***Direct Messages***"
      response.data.each do |message|
        puts "#{message['sender']['screen_name']} => #{message['text']}"
      end
    end
  end
end