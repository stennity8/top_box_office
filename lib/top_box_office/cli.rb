class TopBoxOffice::CLI
  attr_accessor :movie_choice, :count

  def call
    @count = 0
    bo_image_and_scrape
    box_office_list
  end

  def bo_image_and_scrape
    # This method performs initial scrape of information to be displayed and displays welcome message.
    TopBoxOffice::Scraper.scrape_imdb

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

    puts "\n             Welcome to Top Box Office!\n".colorize(:color => :yellow).blink        
  end

  def box_office_list
    location = TopBoxOffice::Movie.all[0].location.split(" ").last[1,2]
    heading_date = TopBoxOffice::Movie.all[0].date

    # Display Box Office Location and Date
    puts "\nThe Top Movies in the #{location} Box Office as of the #{heading_date} are:\n".bold

    # List all Top Box Office Movies that were scraped
    TopBoxOffice::Movie.all.each.with_index(1) do |movie, index|
      title = movie.title
      puts "#{index}. #{title}".bold
    end 
    user_input_and_validation   
  end

  # Prompt message and check if user input 'exit'
  def prompt_and_handle_exit(message)
    puts message
    user_input = gets.strip
    
    if user_input.downcase == "exit" 
      puts "\nThanks for stopping by!\n".colorize(:color => :green) 
      exit
    end     
    user_input
  end

  def not_valid_message
    puts "\nWe're sorry but that is not a valid choice.".colorize(:color => :white, :background => :red)
  end

  def user_input_and_validation 
    # count variable to allow invalid input 3 times before reprinting list.
    # @count is used to allow for this function to utilize recursion.

    # Get user input for box office data
    user_input = prompt_and_handle_exit("\nWhich number on the list would you like to see the earnings for?").to_i

    # Validate users input is number on list
    if user_input > 0 && user_input <= TopBoxOffice::Movie.all.length
      @count = 0
      index = user_input.to_i - 1
      @movie_choice = TopBoxOffice::Movie.all[index]
      @movie_choice.print_earnings
      more_info?
    elsif @count < 3
      not_valid_message
      @count += 1
      user_input_and_validation
    else
      @count = 0
      not_valid_message
      box_office_list
    end
  end

  def more_info?
    # Prompt user for navigation
    user_input = prompt_and_handle_exit("\nWould you like to see additional information on this movie? (Y/N/EXIT)")
    
    if ["y", "yes"].include?(user_input)
      # Scrape additional movie info and call output function to display information.  
      # First check that additional movie has not already been scraped.
      if @movie_choice.secondary_scrape == false
        TopBoxOffice::Scraper.scrape_movie(@movie_choice)
        @movie_choice.print_additional_movie_info
        continue?
      end
        @movie_choice.print_additional_movie_info
        continue?
    elsif ["n", "no"].include?(user_input)
      box_office_list
    else
      not_valid_message
      more_info?
    end
  end

  def continue?
    # Allows user to quit or continue after viewing detailed movie info
    puts"\nWould you like to return to the Top Box Office List and explore other movies? (Y/N/EXIT)"
    user_input = gets.strip.downcase
    if ["y", "yes"].include?(user_input)
      box_office_list
    elsif ["n", "no", "exit"].include?(user_input)
      puts "\nThanks for stopping by!\n".colorize(:color => :green)
      exit
    else
      not_valid_message
      continue?
    end
  end
end