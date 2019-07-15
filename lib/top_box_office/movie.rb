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

end