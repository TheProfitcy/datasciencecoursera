# template for "Guess the number" mini-project
# input will come from buttons and an input field
# all output for the game will be printed in the console

import simplegui
import random

# helper function to start and restart the game
def new_game():
    # initialize global variables used in your code here
    global secret_number
    global number_of_guesses
    secret_number = random.randrange(0, 101)
    number_of_guesses = 7
    print ""
    print "New Game! Current range is set to 0 - 100!"

# define event handlers for control panel
def range100():
    # button that changes the range to [0,100) and starts a new game 
    global secret_number
    global number_of_guesses
    secret_number = random.randrange(0, 101)
    number_of_guesses = 7
    print "New Game! Current range is set to 0 - 1000!"

def range1000():
    # button that changes the range to [0,1000) and starts a new game     
    global secret_number
    global number_of_guesses
    secret_number = random.randrange(0, 1001)
    number_of_guesses = 10
    print "New Game! Current range is set to 0 - 1000!"
    
def input_guess(guess):
    # main game logic goes here
    global number_of_guesses
    guess = int(guess)
    print ""
    print "Guess was: ", guess
    print ""
    
    if guess > secret_number:
        print "Lower!"
        print ""
        number_of_guesses -= 1
        print "Guesses Remaining: ", number_of_guesses
        print ""
        
        if number_of_guesses == 0:
            print "Game Over! You Ran Out Of Guesses!"
            new_game()
            
    elif guess < secret_number:
        print "Higher!"
        print ""
        number_of_guesses -= 1
        print "Guesses Remaining: ", number_of_guesses
        print ""
        
        if number_of_guesses == 0:
            print "Game Over! You Ran Out Of Guesses!"
            new_game()
        
    elif number_of_guesses == secret_number:
        print "Correct!"
        new_game()
        
    else:
        print "S**t, something's broken."
        new_game()
    
# create frame
frame = simplegui.create_frame("Guess The Number", 175, 175)

# register event handlers for control elements and start frame
frame_input = frame.add_input("Your Guess: ", input_guess, 100)
range_100 = frame.add_button("Range 1 - 100", range100, 100)
range_1000 = frame.add_button("Range 1- 1000", range1000, 100)
frame.start()

# call new_game 
new_game()


# always remember to check your completed program against the grading rubric
