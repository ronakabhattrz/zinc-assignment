class Search
  def initialize(query, pages_to_search)
    @query = query
    @webpages = pages_to_search
    @relations = {}
  end

  def query
    @query
  end

  def webpages
    @webpages
  end

  def relations
    @relations
  end

  def get_top_five_pages
    Hash[*@relations.sort_by { |k,v| -v }[0..4].flatten]
  end

  def calculate_relations
    @webpages.each do |page_no, page|
      query_keywords_weights = @query.keyword_weights
      page_keyword_weights = page.keyword_weights
      strength_of_relationship = 0
      query_keywords_weights.each do |query_keyword, query_keyword_weight|
        if ( page_keyword_weights.has_key?(query_keyword) )
          weight_of_key = page_keyword_weights[query_keyword]
          product = weight_of_key * query_keyword_weight
          strength_of_relationship = strength_of_relationship + product
        end
      end
      if strength_of_relationship != 0
        @relations[page_no] = strength_of_relationship
      end
    end
    @relations = Hash[@relations.sort_by{|k, v| v}.reverse]
  end

  def get_formated_search_results
    self.calculate_relations()
    out_put_hash = self.get_top_five_pages
    pages_to_display = out_put_hash.keys
    "Q#{@query.query_number}:#{pages_to_display.join(",")}"
  end

end