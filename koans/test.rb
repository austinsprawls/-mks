def no_repeat?(year)
    year_hash = {}
    year_arr = year.to_s.split(//)
    year_arr.each { |k| year_hash[k] = year_arr.count(k) }
    year_hash.values.each {|v| return false unless v < 2}
    return true
end

def no_repeats(year_start, year_end)
    years_arr = []
    while year_start <= year_end
        years_arr << year_start if no_repeat?(year_start)
        year_start += 1
    end
    years_arr
end

def roll(num)
    values = []
    while num > 0
        values << rand(1..6)
        num -= 1
    end
    values
end

def wonky_coins(n)
    if n == 0
         return 1
     else
         return wonky_coins(n/2) + wonky_coins(n/3) + wonky_coins(n/4)
     end
end

def ordered_vowel_word?(word)
    vow = ['a', 'e', 'i', 'o', 'u']
    letter_list = word.split(//)
    new_list = []
    letter_list.each { |letter| new_list << letter if vow.include?(letter) }
    return new_list == new_list.sort
end

def ordered_vowel_words(str)
    ordered_vowels = ""
    str.split.each {|word| ordered_vowels << "#{word} " if ordered_vowel_word?(word)}
    ordered_vowels
end


def word_unscrambler(word, array)
    eql_array = []
    array.each { |phrase| eql_array << phrase if phrase.split(//).sort == word.split(//).sort}
    eql_array
end

def morse_encode_word(word)
    morse = {'a' => '.-', 'b' => '-...', 'c' => '-.-.', 'd' => '-..', 'e' => '.', 'f' => '..-.', 'g' => '--.', 'h' => '....',
        'i' => '..', 'j' => '.---', 'k' => '-.-', 'l' => '.-..', 'm' => '--', 'n' => '-.', 'o' => '---', 'p' => '.--.',
        'q' => '--.-', 'r' => '.-.', 's' => '...', 't' => '-', 'u' => '..-', 'v' => '...-', 'w' => '.--',
        'x' => '-..-', 'y' => '-.--', 'z' => '--..'}
    morse_array = []
    word.split(//).each { |letter| morse_array << morse[letter] }
    morse_array.join(" ")
end

def morse_encode(phrase)
    phrase_array = phrase.split
    morse_array = []
    phrase_array.each {|word| morse_array << morse_encode_word(word) }
    morse_array.join("  ")
end

puts morse_encode("this is a test phrase")
