module FunWithStrings
  def palindrome?
    string = self.downcase.gsub(/(\W|\s)+/i,'')
    string.reverse == string
  end
  def count_words
    dict = {}
   if self != ""
    self.downcase.gsub!(/\b\w*[^\W*]\b/){ |w|
      p w
      if dict.has_key? w
        dict[w] += 1
      else
        dict[w] = 1
      end
    }
   end
    dict
  end
  def anagram_groups
    result = []
    self.split(' ').each do |word|
      added = false
      if result.size > 0
        result.each do |arr|
          arr.each do |el|
            if el.downcase.chars.sort == word.downcase.chars.sort
              arr << word
              added = true
              break
            end
          end
          break if added
        end
      end
      result << [word] unless added
    end
    result
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
