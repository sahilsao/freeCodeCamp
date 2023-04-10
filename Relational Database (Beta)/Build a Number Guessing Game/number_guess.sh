#!/bin/bash
#Guessing game
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
#function to verify if an integer
NUMBER_VERIFICATION() {
  read GUESS_NUMBER
  while [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
  read GUESS_NUMBER
  done
}

#search for user name in database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  #update users tables
  INSERT_USERNAME=$($PSQL"INSERT INTO users(username) VALUES ('$USERNAME')")
else
  #get games stats
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID GROUP BY user_id;")
  BEST_GAMES=$($PSQL "SELECT MIN(number_of_tries) FROM games WHERE user_id = $USER_ID GROUP BY user_id;")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAMES guesses."
fi
#Generating a random number between 1 and 1000
SECRET_NUMBER=$(( 1 + $RANDOM % 1000 ))
echo -e "\nGuess the secret number between 1 and 1000:"

#Prompting user to enter number and verifying its a number
NUMBER_VERIFICATION

#Message if guess is not equal to number
NUMBER_OF_GUESS=0
while [[ GUESS_NUMBER -ne SECRET_NUMBER ]]
do
  #if higher than or lower than
  if [[ GUESS_NUMBER -lt SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
(( ++NUMBER_OF_GUESS ))
NUMBER_VERIFICATION
done

#Update games tables
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_GAME_RESULTS=$($PSQL "INSERT INTO games(user_id,number_of_tries) VALUES($USER_ID,$NUMBER_OF_GUESS)")
#message for correct guess
echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"