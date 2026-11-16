#!/usr/bin/env bash
# File: guessinggame.sh
# A game where the user guesses how many files are in the current directory.

# Count the files in the current directory
function count_files {
	ls -1 | wc -l
}

correct=$(count_files)
guess=-1

echo "Welcome to the guessing game!"

while [[ $guess -ne $correct ]]
do
	echo "How many files are in the current directory? Enter your guess:"
	read guess

	# Make sure the guess is a whole number
	if ! [[ $guess =~ ^[0-9]+$ ]]
	then
		echo "Please enter a whole number."
		guess=-1
	elif [[ $guess -lt $correct ]]
	then
		echo "Your guess is too low. Try again."
	elif [[ $guess -gt $correct ]]
	then
		echo "Your guess is too high. Try again."
	fi
done

echo "Congratulations! You guessed it: there are $correct files in this directory."
