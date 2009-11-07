Dir[File.dirname(__FILE__) + "/commands/*.rb"].each {|file| require file }

class CommandDispatcher
  attr_reader :commands, :app

  def initialize(app)
    @app = app
    @commands = []

    #Register commands (would be nice to auto register these if possible)
    @commands.push ExitCommand.new
    @commands.push HelpCommand.new
    @commands.push LoginCommand.new
    @commands.push FriendsTimelineCommand.new
    @commands.push TweetCommand.new
    @commands.push FollowersCommand.new
    @commands.push MentionsCommand.new
    @commands.push DirectMessagesCommand.new
    @commands.push FavoritesCommand.new
    @commands.push FollowCommand.new
    @commands.push UnfollowCommand.new
    @commands.push FollowingCommand.new
  end

  def execute(command_name)
    found = false
    
    @commands.each do |command|
      if(command.name == command_name)
        found = true
        command.execute @app
      end
    end

    return found
  end
end