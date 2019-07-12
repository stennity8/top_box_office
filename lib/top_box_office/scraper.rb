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


  def self.scrape_movie(movie_choice)
    page = Nokogiri::HTML(open(movie_choice.url))
    rating_block = page.css('div.imdbRating')
    plot_block = page.css('div.plot_summary')

    # Scrape title block string and parse to array of only needed data
    title_block_string = page.css('div.titleBar').css('div.subtext').text.strip.split("\n")
    title_block_array = title_block_string.map{|e| e.strip}.select{|e| e != "|" && e != ""}


    movie_info = {
       # alternate  length: title_block.css('div.subtext time').text.strip,
      rated: title_block_array[0],
      length: title_block_array[1],
      genres: title_block_array[2] + " " + title_block_array[3] + " " + title_block_array[4],
      release_date: title_block_array[5],
      imdb_rating: rating_block.css('div.ratingValue span').text,
      review_number: rating_block.css('span.small').text,
      tag_line: plot_block.css('div.summary_text').text.strip,
      director: plot_block.css('div.credit_summary_item')[0].css("a").map{|a| a.text}.join(", "),
      stars: plot_block.css('div.credit_summary_item')[2].css("a").map{|a| a.text}[0..2].join(", "),
    }
    binding.pry
    movie_choice.more_info(movie_info)
  end

end