class WordFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def sentences

  end
  
  def conn
    Faraday.new(url: 'https://od-api.oxforddictionaries.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def result
    response = conn.get("/api/v1/entries/en/#{@word}/sentences")
    a = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
