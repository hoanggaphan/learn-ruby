def substrings(word, dictionary)
    result = Hash.new(0)
    word_downcased = word.downcase
    dictionary.each do |dict_word|
        dict_word_downcased = dict_word.downcase
        count = word_downcased.scan(dict_word_downcased).length
        result[dict_word_downcased] = count if count > 0
    end
    result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

p substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
