class TopBoxOffice::CLI
  attr_accessor :movie_choice

  def call
    TopBoxOffice::Scraper.scrape_imdb
    bo_image
    puts "\nWelcome to Top Box Office!\n\n"
    
    # After scraper class runs and puts all movies into Movie Class(s) display 
    # list and request user input
    box_office_list
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

  def box_office_list
    location = TopBoxOffice::Movie.all[0].location.split(" ").last[1,2]
    heading_date = TopBoxOffice::Movie.all[0].date

    # Display Box Office Location and Date
    puts "\nThe Top Movies in the #{location} Box Office as of the #{heading_date} are:\n\n"

    # List all Top Box Office Movies that were scraped
    TopBoxOffice::Movie.all.each.with_index(1) do |movie, index|
      title = movie.title
      puts "#{index}. #{title}"
    end

    # Get user input for box office data
    puts "\nWhich number on the list would you like to see the earnings for?"
    user_input = gets.strip.to_i

    # Show earning for selected movie
    print_earnings(user_input)
  end

  def print_earnings(user_input)
    index = user_input.to_i - 1
    @movie_choice = TopBoxOffice::Movie.all[index]

    puts "\n#{@movie_choice.title} earned #{@movie_choice.weekend} the #{@movie_choice.date}."
    puts "#{@movie_choice.title} has grossed #{@movie_choice.gross} over #{@movie_choice.weeks} week(s)."
    
    more_info?
  end

  def more_info?
    # Prompt user for navigation
    puts "\nWould you like to see additional information on this movie? (Y/N/EXIT)"
    user_input = gets.strip.downcase
    if ["y", "yes"].include?(user_input)
      # Scrape additional movie info and call output function to display information
      TopBoxOffice::Scraper.scrape_movie(@movie_choice)
      additional_movie_info
    elsif ["n", "no"].include?(user_input)
      box_office_list
    elsif user_input == "exit"
      puts "Thanks for stopping by!"
    else
       puts "We're sorry but we didn't understand you."
       more_info?
    end
  end

  def additional_movie_info
    puts "\n\n#{movie_choice.title} - #{movie_choice.tag_line}"
    puts "\nStarring: #{movie_choice.stars[0]}, #{movie_choice.stars[1]}, and #{movie_choice.stars[2]}."
    if movie_choice.director.length > 1
      puts "Directed by #{movie_choice.director[0]} and co-directed by #{movie_choice.director[1]}."
    else
      puts "Directed by #{movie_choice.director[0]}."
    end
    puts "This #{movie_choice.genres[0]}/#{movie_choice.genres[1]}/#{movie_choice.genres[2]} is rated #{movie_choice.rated} and has a run time of #{movie_choice.length}."
    puts "IMDB currently rates this movie at #{movie_choice.imdb_rating} based on #{movie_choice.review_number} reviews."
    # binding.pry
  end

end