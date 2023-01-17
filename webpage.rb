# Class to hold the Webpage Entity
class Webpage
  attr_reader :keywords
  attr_reader :page_number
  attr_reader :weights
  attr_reader :keyword_weights

  def initialize(keywords, page_number)
    @keywords = keywords
    @page_number = page_number
    @weights = []
    @keyword_weights = {}
    MAXIMUM_NUMBER_OF_KEYWORDS.downto(MAXIMUM_NUMBER_OF_KEYWORDS - (@keywords.length - 1)) do |i|
      @weights.push(i)
    end

    @keywords.each_with_index do |element,index|
      @keyword_weights[element] = @weights[index]
    end
  end
end