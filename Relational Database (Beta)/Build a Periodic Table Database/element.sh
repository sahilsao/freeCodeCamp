#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  INPUT=$1

  # definitions
  # AN as ATOMIC_NUMBER
  # AN_AN ATOMIC_NUMBER if input was atomic_number
  # AN_SY ATOMIC_NUMBER if input was symbol
  # AN_NM ATOMIC_NUMBER if input was name

  # define initially as AN=0
  AN=0

    # PSEUDO CODE:
  # check if INPUT is a number
  if [[ $INPUT =~ ^[0-9]*$ ]]
  then 
    AN_SY=0
    AN_NM=0

    # define AN_AN and equal to zero if not defining AN. If yes, make AN equal to it.
    if [[ -z $($PSQL "SELECT atomic_number FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$INPUT") ]]
    then
      AN_AN=0
    else
      AN_AN=$($PSQL "SELECT atomic_number FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$INPUT")
      AN=$AN_AN
    fi

  else
    AN_AN=0

    # define AN_SY  and equal to zero if not defining AN. If yes, make AN equal to it.
    AN_SY=$($PSQL "SELECT atomic_number FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$INPUT'")
    if [[ -z $AN_SY ]]
    then
      AN_SY=0
    else
      AN=$AN_SY
    fi

    # define AN_NM and equal to zero if not defining AN. If yes, make AN equal to it.
    AN_NM=$($PSQL "SELECT atomic_number FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$INPUT'")
    if [[ -z $AN_NM ]]
    then
      AN_NM=0
    else
      AN=$AN_NM
    fi
  fi

  # result: AN is either defined or equal to zero

  if [[ $AN == 0 ]]
  then
    MESSAGE_ELEMENT_NOT_FOUND_NF="I could not find that element in the database."
    MESSAGE_ELEMENT_NOT_FOUND=$(echo $MESSAGE_ELEMENT_NOT_FOUND_NF | sed -r 's/^ *| *$//g')
    echo $MESSAGE_ELEMENT_NOT_FOUND
  else
    # define NAME_NF as not formatted and trim
    NAME_NF=$($PSQL "SELECT name FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$AN")
    NAME=$(echo $NAME_NF | sed -r 's/^ *| *$//g')

    # define SYMBOL_NF as not formatted and trim
    SYMBOL_NF=$($PSQL "SELECT symbol FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$AN")
    SYMBOL=$(echo $SYMBOL_NF | sed -r 's/^ *| *$//g')

    # define TYPE_NF as not formatted and trim
    TYPE_NF=$($PSQL "SELECT type FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$AN")
    TYPE=$(echo $TYPE_NF | sed -r 's/^ *| *$//g')

    # define ATOMIC_MASS
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$AN")
    
    # define MELTINT_POINT
    MELTINT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$AN")
    
    # define BOILING_POINT
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$AN")
    
    # echo The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTINT_POINT celsius and a boiling point of $BOILING_POINT celsius.
    MESSAGE_ELEMENT_FOUND="The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTINT_POINT celsius and a boiling point of $BOILING_POINT celsius."
    echo $MESSAGE_ELEMENT_FOUND
  fi
fi