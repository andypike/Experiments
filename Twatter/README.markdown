**Twatter**

Twatter is a very basic console Twitter client.

Here are the supported commands:

* exit => Exits the application
* help => Displays this help list
* login => Prompts you for your Twitter user name and password. If valid, these are cached for other commands
* friends_timeline => Lists the latest 20 tweets from you and your friends
* tweet => Send a new tweet to share with the world upto a maximum of 140 characters
* followers => Lists up to 100 of your followers
* mentions => Lists the latest 20 tweets that contain your user name
* dms => Lists the latest 20 direct messages sent to you
* favorites => Lists the latest 20 tweets that you have marked as your favorite
* follow => Allows you to follow a new friend
* unfollow => Allows you to stop following a friend
* following => Lists up to 100 friends that you are following

Twatter requires the following gems:

    gem install json

Once you have the gems installed, you can run Twatter with the following:

    ruby twatter.rb

Twatter is my very first Ruby application so it probably isn't written the best way, so any comments are welcome (please go easy on me). There are no tests as yet, I'm learning the language first ;o)

You can contact me via Twitter: @andypike