require "colorize"

class WordGuess
	def initialize
		@words = ["test"]
		@hidden_word = @words[rand(@words.length)]
		@hidden_word_array = @hidden_word.split('')
		@right_answers = []
		@wrong_answers = []
		@count_wrong = 0
		@blank_row = "_ " * @hidden_word.length
		@answer_output = @blank_row.split(' ')
	
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
	We have given you blank spaces to make things easier.
	We hear humans like to do it the easy way.\n

YES

		puts introduction 
		puts @blank_row.center(65)
		puts user_input
	end

	def user_input
		until @hidden_word_array == @answer_output
			puts ascii_art

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
					if @hidden_word_array[x] == @letter
						@answer_output[x] = @letter
					end
				end

			else
				puts "Nope! That's not right!"
				@count_wrong += 1
				@wrong_answers << @letter
			end

			puts @answer_output.join(' ')
		end

		puts "You have won"
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