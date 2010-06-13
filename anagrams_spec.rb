require 'anagrams'

describe Anagrams do
  describe "clean_up_words" do

    it "should discard words with numbers" do
      Anagrams.new(['Abc123def']).words.should == []
    end

    it "should discard words with punctuation" do
      Anagrams.new(['Abc-pod']).words.should == []
    end
  end

  describe "make" do

    describe "If an anagram set contains no angrams" do
      before (:each) do
        @anagram = Anagrams.new(['halls', 'omg'])
      end

      it "should not return sets that contain only one word" do
        @anagram.make.should be_empty
      end
    end

    describe "If an anagram set contains two words" do
      before (:each) do
        @anagram = Anagrams.new(['halls', 'shall'])
      end

      it "should contain two lines" do
        @anagram.make.should == [['halls', 'shall'], ['shall', 'halls']]
      end
    end

    describe "If an anagram set contains two words with different case" do
      before (:each) do
        @anagram = Anagrams.new(['halls', 'SHALL'])
      end

      it "should return them as anagrams" do
        @anagram.make.should == [['halls', 'SHALL'], ['SHALL', 'halls']]
      end
    end

    describe "with a set of words" do
      before(:each) do
        words = ['5th', 'ascot', 'ate', 'carrot', 'coast', 'coats', 'cots', 'Dorian', 'eat', 'halls', 'headskin',
                 'inroad', 'nakedish', 'ordain', "Ronald's", 'shall', 'sinkhead', 'tacos', 'tea']
        @anagram = Anagrams.new(words)
      end

      it "should return the dictionary" do
        @anagram.make.should ==
       ["Dorian inroad ordain",
       "ascot coast coats tacos",
       "ate eat tea",
       "coast (See 'ascot')",
       "coats (See 'ascot')",
       "eat (See 'ate')",
       "halls shall",
       "headskin nakedish sinkhead",
       "inroad (See 'Dorian')",
       "nakedish (See 'headskin')",
       "ordain (See 'Dorian')",
       "shall halls",
       "sinkhead (See 'headskin')",
       "tacos (See 'ascot')",
       "tea (See 'ate')"]
      end
    end
  end
end