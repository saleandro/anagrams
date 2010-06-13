class Anagrams

  attr_accessor :words

  def initialize(words)
    @words = clean_up_words(words)
  end

  def make
    anagrams = {}
    @words.each do |word|
      downcase_word = word.downcase
      sorted_letters =  downcase_word.split('').map{|c| c}.sort.join('')
      if anagrams.key?(sorted_letters)
        anagrams[sorted_letters] << word
      else
        anagrams[sorted_letters] = [word]
      end
    end
    anagrams = anagrams.values.select {|value| value.size > 1}.sort
    anagrams.map {|v| v.map(&:strip).join(" ")}
  end

  private

  def clean_up_words(words)
    words.select { |w| w =~ /^[a-z]+$/i }
  end
end

