words = %w{Site My Book Home Code Ruby Rails Camel Way Monkey}
words2 = %w{sun sea sand red blue green}

first_words = words
second_words = words
cool_websites = []

first_words.each do |first_word|
  second_words.each do |second_word|
    cool_websites << "www.#{first_word.downcase+second_word.downcase}.com" unless first_word == second_word
  end
end 

puts cool_websites


  