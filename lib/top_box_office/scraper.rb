class TopBoxOffice::Scraper

  # Scrape the top box office movies and create a movie object for each
  def self.scrape_imdb
    page = Nokogiri::HTML(open('https://www.imdb.com/chart/boxoffice'))
    bo = page.css('div.article')
    bo_location = page.css('div.article h1.header').text
    bo_date = page.css('div.article div#boxoffice h4').text
    bo_movies = page.css('div.article table.chart tbody tr')
    
    bo_movies.map do |movie|
      initial_info = {
        location: bo_location,
        date: bo_date,
        title: movie.css('td.titleColumn a').text.strip, 
        weekend: movie.css('td.ratingColumn')[0].text.strip, 
        gross: movie.css('td.ratingColumn span.secondaryInfo').text.strip, 
        weeks: movie.css('td.weeksColumn').text.strip, 
        url: "https://www.imdb.com" + movie.css('td.titleColumn a')[0].attributes['href'].value
      }

    # Create Movie Objects for each Top Box Office Movie    
    TopBoxOffice::Movie.new(initial_info)
    end
  end


  def self.scrape_movie(movie_url)

  end

end