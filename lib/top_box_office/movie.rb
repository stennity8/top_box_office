class TopBoxOffice::Movie
  attr_accessor :title, :weekend, :gross, :weeks, :rated, :length, :genres, :release_date,
                :rating, :review_number, :tag_line, :director, :stars 

  @@all = []

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