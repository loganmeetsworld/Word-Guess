require "colorize"
require "./word_guess_art.rb"

MAX_GUESSES = 6

class WordGuess
	def initialize
		@words = ["test"]
		@hidden_word = @words[rand(@words.length)]
		@wrong_answers = []
		@count_wrong = 0 
		@right_answers = []
		@blank_row = "_ " * @hidden_word.length
		@answer_output = @blank_row.split(' ')
		@hidden_word_array = @hidden_word.split('')
	
		puts @blank_row
		puts user_input
	end

	def display
		introduction = <<YES
			     <----->
   			    <  (0)  >
   			    |       |
   			   < ------- >
   			   o         o
   			   o ()  ()  o
   			  o           o
   			o o o o o o o o o
   			o o o o o o o o o
   			o o o o o o o o o

	The robots are coming to 'TERMINATE' mankind!
	Please help us guess the word before we all perish.

YES

		puts introduction 
		puts @blank_row
		puts user_input
	end

	def user_input
		until @hidden_word_array == @answer_output
			print ascii_art

			puts "\n Enter a letter to guess. Try not to guess wrong."
			puts "Right guesses: #{@right_answers}."
			puts "Wrong guesses: #{@wrong_answers}"

			@letter = gets.chomp.downcase
			puts check_user_input

			# while @wrong_answers.length < MAX_GUESSES
				if @hidden_word_array.include?(@letter)
					# times_in_array = @hidden_word_array.count(letter)
					# add_letters = [letter] * times_in_array
					# @right_answers += add_letters

					@hidden_word_array.each_index do |x|
						if @right_answers[x] == @letter
							@answer_output[x] = @letter
						end
					end

				else
					puts "Nope! That's not right!"
					@wrong_answers << @letter
					@count_wrong += 1
				end

				puts "Right: #{@right_answers}"
				puts "Wrong: #{@wrong_answers}"
				
				@letter = gets.chomp.downcase
			# end
		end
	end

	def check_user_input
		# Check to see if this is a number or a letter or what it is
		# Maybe update this to take regex? 
		while @letter.length > 1 || @letter.to_i != 0 || @letter == "0"
			puts "Please put a valid input! Robots don't like invalid inputs."
			@letter = gets.chomp.downcase
		end
	end

	def ascii_art
		case @count_wrong
		when 1
			puts "
		 	  (\\____/)
		       (_oo_)
		         (O)
		  ".colorize(:yellow)
		when 2
			puts "
     	  (\\____/)
           (_oo_)
             (O)
           __||__    \\)

			".colorize(:yellow)
		when 3
			puts "
				(\\____/)
           (_oo_)
             (O)
           __||__    \\)
          /______\\[] /
          \\______/ \\/
			".colorize(:magenta)
		when 4
			puts "
				(\\____/)
           (_oo_)
             (O)
           __||__    \\)
        []/______\\[] /
        / \\______/ \\/
       /    
      (\\    	
			".colorize(:magenta)
		when 5
			puts "
				(\\____/)
           (_oo_)
             (O)
           __||__    \\)
        []/______\[] /
        / \\______/ \/
       /    /__\\ 
      (\\   /____\\ 
			".colorize(:red)
		when 6
			puts "
						  (\\____/)
			           (_oo_)
			             (O)
			           __||__    \\)
			        []/______\[] /
			        / \\______/ \/
			       /    /__\\ 
			      (\\   /____\\ 

######## ######## ########   ###  ## ###  ## ##   ## ######## ###  ##     ####
               ##    ###     ###  ## ###  ## ### ###       ## #### ##    ###  
 #######  #######    ###     ####### ###  ## #######  ####### #######    ###  
 ###      ###  ##    ###     ###  ## ###  ## ## # ##  ###  ## ### ###    ###  
 #######  ###  ##    ###     ###  ##  #####  ##   ##  ###  ## ###  ## #####   
                             ###             ##                     #        
			".colorize(:red).blink
				
		end
	end
end

w = WordGuess.new