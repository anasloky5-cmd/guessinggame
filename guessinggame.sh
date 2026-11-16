#!/usr/bin/env bash
# guessinggame.sh - guess how many files are in the current directory

function count_files {
    ls -1A | wc -l | tr -d ' '
}

function check_guess {
    local guess=$1
    local answer=$2
    if [[ $guess -lt $answer ]]
    then
        echo "Your guess is too low. Try again."
    elif [[ $guess -gt $answer ]]
    then
        echo "Your guess is too high. Try again."
    fi
}

answer=$(count_files)
guess=-1

echo "Welcome to the guessing game!"

while [[ $guess -ne $answer ]]
do
    echo "How many files are in the current directory? Enter your guess:"
    read guess
    if ! [[ $guess =~ ^[0-9]+$ ]]
    then
        echo "Please enter a whole number."
        guess=-1
        continue
    fi
    check_guess $guess $answer
done

echo "Congratulations! You guessed correctly: there are $answer files here."
