# Class to parse the input
class InputProcessor
  def initialize
    @input_data = input_data
    @web_page_count = 1
    @query_count = 1
    @web_pages = {}
    @queries = {}
    @output_data = []
  end

  def input_data
    ['P Ford Car Review',
     'P Review Car',
     'P Review Ford',
     'P Toyota Car',
     'P Honda Car',
     'P Car',
     'Q Ford',
     'Q Car',
     'Q Review',
     'Q Ford Review',
     'Q Ford Car',
     'Q cooking French']
  end

  # process input data
  # by classifying the data into webPages and Queries
  def process_input_data
    @input_data.each do |line|
      if line.start_with?('P')
        array_of_webpage_keywords = line.split(' ')
        array_of_webpage_keywords.shift
        webpage = Webpage.new(array_of_webpage_keywords, @web_page_count)
        hash_index = "P#{@web_page_count}"
        @web_pages[hash_index] = webpage
        @web_page_count += 1
      else
        array_of_query_keywords = line.split(' ')
        array_of_query_keywords.shift
        query = Query.new(array_of_query_keywords, @query_count)
        hash_index = "Q#{@query_count}"
        @queries[hash_index] = query
        @query_count += 1
      end
    end
  end

  # Display output data
  def display_output
    @queries.each do |_key, value|
      search_object = Search.new(value, @web_pages)
      puts search_object.get_formated_search_results
    end
  end
end
