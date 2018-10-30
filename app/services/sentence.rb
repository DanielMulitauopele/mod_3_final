class Sentence
  attr_reader :text, :region

  def initialize(sentence_data)
    @text = sentence_data[:text]
    @region = sentence_data[:regions].first
  end
end
