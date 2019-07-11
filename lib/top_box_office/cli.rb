class TopBoxOffice::CLI
  def call
    bo_image
    puts "\nWelcome to Top Box Office!\n\n"
    # Scraper class runs and puts all movies into Movie Class(s)
    # expected output to be something like below
    puts "Here is a list of the top movies in the box office right now:"
    puts "1. Spiderman"
    puts "2. Toy Story 4"
    puts "3. Yesterday"
    puts "Which movie would you like to see the earnings for as of {weekend}?"
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