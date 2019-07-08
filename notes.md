Top Box Office CLI

*TBD if Director and Director Info to be included as well

CLI Flow Pattern
1. Prompt the user with a welcome.
2. Scrape the Top Box Office Movies from IMDB in Scraper Class
3. Create Box Office object with BoxOffice Class
4. Display list of Top Box Office Movies with index numbers
5. Prompt the user to select a movie for stats on box office performance
6. Return the stats from the BoxOffice object to the user
7. Prompt the user to either return to the list(a.) to see other box office stats
    or to see additional information on the chosen movie(b.).
8. a. return to #5
   b. scrape additional information into movie object and display to user
9. Prompt the user to return to box office list or 'exit'
10. exit with goodbye prompt or return to #4


Additional design items:
- There will be three four classes:  CLI, Scraper, BoxOffice, Movie
- There will be a 'has many' relationship between the BoxOffice class and the Movie class
  i.e. the BoxOffice has many Movies
- Initial listing of movies should have the heading stating what "weekend of month"
  is most recent for this data.  This info is available to be scraped from IMDB
- Iniital info provided for selected movie will include Weekend $, Gross $, and Weeks in    theater #
- Additional information that will be provided can include items such as: name, 
  rated (G, PG, PG-13, R), review rating (ex. 8.1/10 from 63,188 reviews), movie
  length, genre, release date, Tag line, Director, Stars, or any other info that
  is available
