class Hangman
    attr_accessor :misses, :correct, :turns, :random_word, :coded_word, :missed_letters
    def intialize
        @misses = 0
        @turns = 0
        @correct = 0

        @random_word = ''
		@coded_word = nil
		@missed_letters = Array.new
    end

    def generate_hangman_word
        words = File.readlines('dictionary.txt')
        not_good_word = true
    
        while not_good_word
            picked_word = words[rand(words.size)].gsub(/\s+/, "")
            not_good_word = false if picked_word.length >= 5 && picked_word.length <= 12
        end
        @coded_word = "_" * picked_word.gsub(/\s+/, "").length
       	@random_word = picked_word.gsub(/\s+/, "")
    end

    def input_letter(inp_char = 'gg')
    	if inp_char.length != 1 && inp_char.is_a?(String) && inp_char =~ /[A-Za-z]/    	    
            return ''	  
        end
        return inp_char 
    end

    def check_if_part(letter)
    	@random_word.each_char.with_index do |char,index|            
    		if letter == char
    			@coded_word[index] = letter
    			@correct += 1
    			@turns += 1
    		end
    	end

    	unless @random_word.include?(letter)
    		@misses += 1
    		@missed_words << letter
    	end
    end

    def win?
    	return true if @correct == @random_word.length && !lose? && @correct != 0
    	return false
    end

    def lose? 
    	return true if @misses >= 6
    	return false
    end

    def engine_start(input)
    		letter = input_letter(input)
    		check_if_part(letter)    		    	
    end

    def reset
        generate_hangman_word
        @misses = 0
        @correct = 0
        @turns = 0
        @missed_words = Array.new
    end
end
