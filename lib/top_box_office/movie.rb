class TopBoxOffice::Movie
  attr_accessor :location, :date, :title, :weekend, :gross, :weeks, :url, :rated, :length, :genres, 
                :release_date, :imdb_rating, :review_number, :tag_line, :director, :stars, :secondary_scrape 

  @@all = []

  def self.all
    @@all
  end

  def initialize(attributes)
    # Add initial info from first scrape to class instance, add instance to @@all, and set secondary_scrape = to false to make sure 
    # there isn't any duplicate scraping when a request for additional info is made.
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @secondary_scrape = false
    @@all << self
  end

  def more_info(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @secondary_scrape = true
  end

   # Method to print movie's info.
  def print_additional_movie_info
    puts "\n\n#{self.title} - #{self.tag_line}".bold
    puts "\nIn theaters starting #{self.release_date}.".bold
    puts "Starring: #{self.stars[0]}, #{self.stars[1]}, and #{self.stars[2]}.".bold
    if self.director.length > 1
      puts "Directed by #{self.director[0]} and co-directed by #{self.director[1]}.".bold
    else
      puts "Directed by #{self.director[0]}.".bold
    end
    puts "This #{self.genres[0]}/#{self.genres[1]}/#{self.genres[2]} is rated #{self.rated} and has a run time of #{self.length}.".bold
    puts "IMDB currently rates this movie at #{self.imdb_rating} based on #{self.review_number} reviews.".bold
  end

    # Method to movie's earnings.
    def print_earnings#(user_input)
      puts "\n#{self.title} earned #{self.weekend} the #{self.date}.".bold
      puts "#{self.title} has grossed #{self.gross} over #{self.weeks} week(s).".bold
    end

end