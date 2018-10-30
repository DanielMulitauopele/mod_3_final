class WordFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def sentences
    result.first[:lexicalEntries].first[:sentences].map do |sentence|
      if sentence[:regions].first == "Canadian" || "British"
        require "pry"; binding.pry
        Sentence.new(sentence)
      else
      end
    end
  end

  def conn
    Faraday.new(url: 'https://od-api.oxforddictionaries.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.headers['app_id'] = '022f27e1'
      faraday.headers['app_key'] = '1e1b0040cf4cccfe9b55204f5f4227be'
      faraday.headers['Accept'] = 'application/json'
    end
  end

  def result
    response = conn.get("/api/v1/entries/en/#{@word}/sentences")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
