class TopBoxOffice::CLI
  def call
    TopBoxOffice::Scraper.scrape_imdb
    bo_image
    puts "\nWelcome to Top Box Office!\n\n"
    # Scraper class runs and puts all movies into Movie Class(s)
    binding.pry
    # expected output to be something like below
    puts "Here is a list of the top movies in the box office right now:"
    puts "1. Spiderman"
    puts "2. Toy Story 4"
    puts "3. Yesterday"
    # Get user input for box office data
    puts "Which movie would you like to see the earnings for as of {weekend}?"
    input = gets.strip.to_i

    puts "Chosen movie box office earnings:"
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
end