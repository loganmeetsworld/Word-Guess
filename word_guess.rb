require "colorize"

LINE_WIDTH = 66

class WordGuess
	def initialize
		@words = ["test"]
		@hidden_word = @words[rand(@words.length)]
		@hidden_word_array = @hidden_word.split('')
		@right_answers = []
		@wrong_answers = []
		@count_wrong = 0
		@blank_row = "_ " * @hidden_word.length
		@answer_array = @blank_row.split(' ')
	
		introduction = <<YES
	The robots are coming to 'TERMINATE' mankind!
	Please help us guess the word before we all perish.\n
	We have given you blank spaces to make things easier.
	We hear humans like to do it the easy way.\n

YES

		puts introduction.colorize(:red)
		puts @blank_row.center(LINE_WIDTH)
		puts user_input
	end

	def user_input
		while @hidden_word_array != @answer_array
			puts ascii_art

			puts "\n Enter a letter to guess. Try not to guess wrong."

			@user_guess = gets.chomp.downcase # The first time we initialize this, why!?!?

			puts check_user_input

			if @hidden_word_array.include?(@user_guess)
				@right_answers << @user_guess

				@hidden_word_array.each_index do |letter|
					if @hidden_word_array[letter] == @user_guess
						@answer_array[letter] = @user_guess
					end
				end

			else
				puts "Nope! That's not right!"
				@count_wrong += 1
				@wrong_answers << @user_guess
			end

			puts "Right guesses: #{@right_answers}"
			puts "Wrong guesses: #{@wrong_answers}\n"
			puts @answer_array.join(' ').center(LINE_WIDTH)
			print %x{clear}
		end

		puts "NOOOOOOO YOU BESTED THE ROBOTS!".colorize(:green).center(LINE_WIDTH)
	end

	def check_user_input
		# Check to see if this is a number or a letter or what it is
		# Maybe update this to take regex? 
		while @user_guess.length > 1 || @user_guess.to_i != 0 || @user_guess == ""
			puts "Please put a valid input! Robots don't like invalid inputs."
			@user_guess = gets.chomp.downcase
		end
	end

	def ascii_art
		case @count_wrong
		when 0
			puts "
			     <----->
   			    <  (0)  >
   			    |       |
   			   < ------- > 
   			   o         o
   			   o ()  ()  o
   			  o           o
   			o o o o o o o o o
   			o o o o o o o o o
   			o o o o o o o o o".colorize(:red)
puts "YOU HAVEN'T MESSED UP YET, TOO BAD.".center(LINE_WIDTH).colorize(:red)
		when 1
			puts "
		 	(\\____/)
		       (_oo_)
		         (O)
		     MWAHAHAHAHAH
		  ".colorize(:yellow)
		when 2
			puts "
     	  (\\____/)
           (_oo_)
             (O)
           __||__    \\)
		YESSS KEEP MAKING MISTAKES!
			".colorize(:yellow)
		when 3
			puts "
				(\\____/)
           (_oo_)
             (O)
           __||__    \\)
          /______\\[] /
          \\______/ \\/
   HUMAN KIND WILL SOON BE MINE!
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
 SERIOUSLY? HUMANS ARE SO STUPID!
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
    	DEATH IS IMMINENT!
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
			exit!
		end
	end
end

w = WordGuess.new