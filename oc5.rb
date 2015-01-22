# OC4. IronhackMDB

# Trumpets are playing, a choir is singing, and a really handsome TV presenter is introducing all you to… THE BIG EXERCISE!

# But don’t be scared. It’s just a bigger exercise than normal, using all the useful stuff we learned this week: testing with RSpec, the TDD methodology, Sinatra, ERB and ActiveRecord. Quite a lot for being just the second week!

# So let’s get hands on it! We decide we love TV shows so much that checking them on IMDB is not enough. We want to implement a web app where we can keep track of the TV shows we love or hate, writing there our own rating and comments.

# We want our web app, which will be called IronhackMDB, to match the following:
#	•	The Model
  #	◦	We have a TVShow model (a skeleton of the class is available in Slack, together with an empty database)
  #	◦	The TVShow has three parameters: the name (so we can look it up at IMDB), our own comments, and our own rating.
  #	◦	The name field should be present, and unique across all our TV shows.
  #	◦	The our_rating field should be present and between 0 and 10 (both included)
  #	◦	The our_comments field should be present, with more than 100 characters but less than 10000
  #	◦	Add tests to match what we want for each one of the three fields
  #	◦	Also add methods to the TVShow model to fetch IMDB rating, numbers of seasons, link, and picture
# •	Web features
  # ◦	In the top of the main page of our site, which will be called IronhackMDB (be sure to add an h1 title that says it!), we will have a
  #   form that will create a new TVShow.
  #	◦	Just below that creation form, we will have links to the main route (‘/‘), the "our ranking" route (‘/our-ranking’) and the “imdb
  #	ranking” route (‘/imdb-ranking’)
  #	◦	Both form and links should be always displayed, in any route (use a template for that!)
  #	◦	The main route (‘/‘) will list, for each one of the TV shows that we have in our database, their name, our own rating, the IMDB
  #	rating, and a link to another route (‘/tv_shows/:tv_show_id’)
  #	◦	The page for a specific TV show (‘/tv_shows/:tv_show_id’) will load the TV show from the database and show a lot of information for
  #	it: the name, our rating and comments, the IMDB rating, number of seasons, picture, and a HTML link to the IMDB page for that tv show.
  #	◦	The ‘/our-ranking’ route will just show a list, of tv shows, like the main route (even the link to the own TV show page), but
  #	ordered, from best to worst, by our own rating
  #	◦	The ‘/imdb-ranking’ should do the same as ‘/our-ranking’ but following IMDB criteria
# Note: the class fields are “name”, “own_rating” and “own_comments”.

# OC4, reloaded. IronhackMDB Premium

# If you finish this before time (I dare you!), we will add a complexity layer to it. The web app that we just wrote is really nice and
# allows us to keep track of TV shows that we love or hate.

# But the lists of TV shows are quite slow, because we have to go fetch the new information in IMDB every time for every TV show. What
# could we do to improve it?

# Exactly: save the IMDB information in the database. This way we only have to fetch it from IMDB when we are going to create the record;
# afterwards the information will be fetched from our database, which is way quicker than going to the Internet.

# You have a new empty database with the additional TVShow fields in slack. Use the .rb file you have build until now, except that you have
# to connect to the “ironhackmdb_premium.sqlite” database.

# Note: first read about Active Record callbacks in http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
# Note: the class fields are “name”, “own_rating”, “own_comments”, “imdb_rating”, “imdb_number_of_seasons”, “imdb_link”, “imdb_picture".
