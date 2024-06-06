#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=postgres --tuples-only -c"

#is_integer() {
#  local s="$1"
#  [[ "$s" =~ ^-?[0-9]+$ ]]
#}

RANDOM_NUMBER=$((($RANDOM % 1000) + 1))

echo $RANDOM_NUMBER

echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "select user_id from users where user_name = '$USERNAME'")

if [[ -z $USER_ID ]]
then 
USER_INSERT_RESULT=$($PSQL "insert into users(user_name) values ('$USERNAME')")
echo "Welcome, $USERNAME! It looks like this is your first time here." | sed 's/ \+/ /g'
else
echo "Welcome back, $($PSQL "select user_name from users where user_id = '$USER_ID'")! You have played $($PSQL "select games_played from users where user_id = '$USER_ID'") games, and your best game took $($PSQL "select best_game from users where user_id = '$USER_ID'") guesses." | sed 's/ \+/ /g'
fi
USER_ID_RESULT=$($PSQL "select user_id from users where user_name='$USERNAME'")

echo "Guess the secret number between 1 and 1000:"
read USER_INPUT
while ! [[ $USER_INPUT =~ ^[0-9]+$ ]] 
do
echo "That is not an integer, guess again:"
read USER_INPUT
done

COUNT=1
while [[ $USER_INPUT -ne $RANDOM_NUMBER ]]
do
  COUNT=$((COUNT + 1))
  if [[ $USER_INPUT -gt $RANDOM_NUMBER ]]
  then
  echo "It's lower than that, guess again:"
  read USER_INPUT
    while ! [[ $USER_INPUT =~ ^[0-9]+$ ]] 
      do
      echo "That is not an integer, guess again:"
      read USER_INPUT
      done
  else 
  echo "It's higher than that, guess again:"
  read USER_INPUT
    while ! [[ $USER_INPUT =~ ^[0-9]+$ ]] 
      do
      echo "That is not an integer, guess again:"
      read USER_INPUT
      done
  fi
done

BEST_GAME=$($PSQL "select best_game from users where user_id ='$USER_ID_RESULT'")


if [[ $COUNT -lt $BEST_GAME ]]
then 
UPDATE_BEST_GAME=$($PSQL "update users set best_game = $COUNT where user_id = $USER_ID_RESULT")
UPDATE_GAMES_PLAYED=$($PSQL "update users set games_played = games_played + 1 where user_id = $USER_ID_RESULT")
else 
UPDATE_GAMES_PLAYED=$($PSQL "update users set games_played = games_played + 1 where user_id = $USER_ID_RESULT")
fi

echo -e "\nYou guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!" | sed 's/ \+/ /g'
exit