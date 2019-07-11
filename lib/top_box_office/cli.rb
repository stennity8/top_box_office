class TopBoxOffice::CLI
  def call
    TopBoxOffice::Scraper.scrape_imdb
    bo_image
    puts "\nWelcome to Top Box Office!\n\n"
    
    # After scraper class runs and puts all movies into Movie Class(s) display 
    # list and request user input
    print_heading

    # Get user input for box office data
    puts "\nWhich number on the list would you like to see the earnings for?"
    user_input = gets.strip.to_i

    #puts "Chosen movie box office earnings:"
    print_earnings(user_input)
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
  end

  def print_earnings(user_input)
    index = user_input.to_i - 1
    movie_choice = TopBoxOffice::Movie.all[index]

    puts "\n#{movie_choice.title} earned #{movie_choice.weekend} the #{movie_choice.date}."
    puts "#{movie_choice.title} has grossed #{movie_choice.gross} over #{movie_choice.weeks} week(s)."
    
    more_info?
  end

  def more_info?
    # Prompt user for navigation
    puts "\nWould you like to see additional information on this movie? (Y/N/Exit)"
    user_input = gets.strip.downcase
    if ["y", "yes"].include?(user_input)
      puts "Show other info"
    elsif ["n", "no"].include?(user_input)
      print_heading
    elsif user_input == "exit"
      puts "Thanks for stopping by!"
    else
       puts "We're sorry but we didn't understand you."
       more_info?
    end
   end
end