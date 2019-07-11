class TopBoxOffice::Movie
  attr_accessor :location, :date, :title, :weekend, :gross, :weeks, :url, :rated, :length, :genres, :release_date,
                :rating, :review_number, :tag_line, :director, :stars 

  @@all = []

  def self.all
    @@all
  end

  def self.reset!
    @@all.clear
  end

  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def more_info(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end