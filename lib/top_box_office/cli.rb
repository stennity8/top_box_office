class TopBoxOffice::CLI
  def call
    TopBoxOffice::Scraper.scrape_imdb
    bo_image
    puts "\nWelcome to Top Box Office!\n\n"

    # Scraper class runs and puts all movies into Movie Class(s)
    print_heading

    # Get user input for box office data
    puts "\nWhich number on the list would you like to see the earnings for?"
    input = gets.strip.to_i

    #puts "Chosen movie box office earnings:"
  end

  def bo_image
    puts ""
    puts "               @-_________________-@"
    puts "         @-_____|   NOW SHOWING   |_____-@"
    puts "          |                             |"
    puts "   _______|_____________________________|__________"
    puts "  |________________________________________________|"
    puts "  |               -                -               |"
    puts "  |   -       -             -                    - |"
    puts "  |        ____    ______________-   ____          |"
    puts "  | -  -  |    |   |  TICKETS   |   |    | -       |"
    puts "  |       |    |   |            |   |    |         |"
    puts "  |  --   |____| - |_o___oo___o_| - |____|     -   |"
    puts "  | -     |    |  |     --       |  |    |         |"
    puts "  |    -  |    |- | -      -     |  |    | --      |"
    puts "  |_______|====|__|______________|__|====|_________|"
        
  end

  def print_heading
    location = TopBoxOffice::Movie.all[0].location.split(" ").last[1,2]
    heading_date = TopBoxOffice::Movie.all[0].date
    
    puts "\nThe Top Movies in the #{location} Box Office as of the #{heading_date} are:\n\n"

    TopBoxOffice::Movie.all.each.with_index(1) do |movie, index|
      title = movie.title
      puts "#{index}. #{title}"
    end
    # binding.pry

  end
end