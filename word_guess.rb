require "colorize"

introduction = <<YES
The robots are coming to 'TERMINATE' mankind!
Please help us guess the word before we all perish.

YES

ascii_1 = """
     	  (\\____/)
           (_oo_)
             (O)

"""


ascii_2 = """
     	  (\\____/)
           (_oo_)
             (O)
           __||__    \\)

"""

ascii_3 = """
     	  (\\____/)
           (_oo_)
             (O)
           __||__    \\)
          /______\\[] /
          \\______/ \\/
"""

ascii_4 = """
     	  (\\____/)
           (_oo_)
             (O)
           __||__    \\)
        []/______\\[] /
        / \\______/ \\/
       /    
      (\\    

"""

ascii_5 = """
     	  (\\____/)
           (_oo_)
             (O)
           __||__    \\)
        []/______\[] /
        / \\______/ \/
       /    /__\\ 
      (\\   /____\\ 

"""

ascii_6 = """
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
"""

puts ascii_1.colorize(:yellow)
puts ascii_2.colorize(:yellow)
puts ascii_3.colorize(:magenta)
puts ascii_4.colorize(:magenta)
puts ascii_5.colorize(:red)
puts ascii_6.colorize(:red).blink




# class Game
# 	def initialize
# 		@words = []

# end

# class Board

# end
