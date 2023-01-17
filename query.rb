# Class to hold the Query Entity
class Query
  attr_reader :keywords
  attr_reader :query_number
  attr_reader :weights
  attr_reader :keyword_weights

  def initialize(keywords, query_number)
    @keywords = keywords
    @query_number = query_number
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