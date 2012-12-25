Welcome to the World of Office Gaming
========

Originally forked from [Sean Moon](https://github.com/seanmoon/pivot-pong), this app was created to provide a ladder ranking for internal ping pong matches. However, this can be repurposed for any kind of competitive play, and you are encouraged to fork your own version customary to your gameplay.

Creation of Players
-------
As you start entering the names for the winner/loser on /matches, it will auto complete if the player already exists. If not, they will be created. Each player also has their own profile page in which they can see their current win/loss record, match history, current achievements, rank history, and probability of beating another player. In order to support profile image uploading, you need to set the environment vars that carrierwave expects: ENV['AWS_KEY'] and ENV['AWS_SECRET']

Ladder Ranking
-------
Rank is calculated after each match is entered. The way that you move up is by beating somebody who has a higher rank than you, and the amount of spots you move is half the distance between ranks. If you are immediately below the person that you are playing, you will switch spots if you win. This means that only second place can dethrone first place.

Achievements
-------
Achievement checking is trigger based. Most of the time the achievements will revolve around the outcome of a match, but there are others that can be obtained outside of entering a match. For example, tweeting a victory or uploading a profile picture. The achievements model is mixed into [font awesome](http://fortawesome.github.com/Font-Awesome/) so your badge list can be extended to any of those as you can see through implementing any of the subclasses. Current list of achievement at the time of writing this are:

- *Smite the Bobby* - Beat the one and only: Bobby Isaacson
- *Twilight Saga* - Log a match after 6pm PST
- *Overly Attached* - Last 6 matches were with the same person
- *The Grind* - Play 5 consecutive matches without changing rank
- *Number Juan* - Dos no es un ganador y tres nadie recuerda
- *Bragging Rights* - Tweet Your Victory
- *Laying Out the Welcome Mat* - Play someone not on the ladder
- *Hulk Smash* - Overall win record vs. someone spreads 10 or more
- *Where'd You Go?* - Gone inactive after 30 days of not playing
- *I Heart You* - Last 3 logged matches were with the same person
- *Morning Madness* - Log a match before 9am PST
- *The Summit* - Played during the Social Chorus Summit
- *You're on a Streak!* - Win 5 matches in a row
- *Long Jump* - Advances more than 3 spots in rank from a single match
- *Little Ben!* - Played more than 50 matches
- *When Life Gives You Lemons...* - Lose 5 matches in a row
- *Big Ben!* - Played more than 100 matches
- *Working Hard or Hardly Working?* - Log more than 5 matches in a single day
- *Picture Perfect* - Upload an avatar in your user profile
- *Beginner* - Welcome to the wonderful game of pong
- *Same Sh*t, Different Day* - Stay the same rank 7 matches in a row

Analytics
-------
At the end of every match, a match log is also created and bound to each of the players. This records the match as well as what the players current rank was at the time of play. You can also see overall win percentage globally at /stats. Played around a little using the [raphael.js](http://raphaeljs.com/) library.

Authentication
-------
The matches and players pages have simple http auth which can be set by **ENV['username']** and **ENV['password']**. They default to ping/pong respectively. Public pages include the list of achievements, what's new, and global stats.

Welcome all comments and feedback (Twitter): [@barretto_chris](http://twitter.com/barretto_chris)