#!/bin/bash

# Translating my python text adventure game to shell :D 
# to-do:
  # add logic to check for presence of sword >> needed to win
  # create a few choices of villain - have chosen at random each game
  # create selection of the good weapon (also the wimpy weapon) to be set at random each game
  # ... maybe also do something like that for the setting... have to think that once through

function INTRO (){
  echo You find yourself standing in a meadow with grass and wild flowers.
  sleep 0.5
  echo Rumor has it that a tax collector is somewhere around here, and has been terrifying the nearby villagers.
  sleep 0.5
  echo In front of you is a house.
  sleep 0.5
  echo -e "In your hand you hold your trusty (but ineffective) fountain pen.\n"
  sleep 0.5
}

function CHOOSE_HOUSE_OR_CAVE () {
  echo Enter 1 to knock on the door of the house.
  sleep 0.5
  echo Enter 2 to peer into the cave.
  sleep 0.5
  echo What would you like to do?
  sleep 0.5
  echo "(Please enter 1 or 2.)"
  read CHOICE  
  if [[ $CHOICE == 1 ]] 
    then KNOCK_DOOR 
  elif [[ $CHOICE == 2 ]]
    then CHOOSE_CAVE 
    # Add logic to check for weapon - action changes accordingly
  else 
    echo That\'s not an option.
    sleep 0.5
    CHOOSE_HOUSE_OR_CAVE  # restate the choices
  fi
}

function KNOCK_DOOR () {
  echo You approach the door of the house.
  sleep 0.5
  echo You are about to enter and out steps the tax collector.
  sleep 0.5
  echo Eep! This is the tax collector\'s house!
  sleep 0.5
  echo The tax collector attacks you!
  sleep 0.5
  echo You feel a little under-prepared, what with only having a fountain pen.
  sleep 0.5
  echo "Would you like to (1) fight or (2) run away?"
  read CHOICE
  if [[ $CHOICE == 1 ]]
    then CHOOSE_FIGHT
  elif [[ $CHOICE == 2 ]]
    then echo You run back into the field.
    sleep 0.5
    echo -e "Luckily, you don't seem to have been followed.\n"
    sleep 0.5
    CHOOSE_HOUSE_OR_CAVE
  else 
    echo That\'s not an option.
    sleep 0.5
    CHOOSE_HOUSE_OR_CAVE
  fi
}

function CHOOSE_CAVE () {
  echo You peer cautiously into the cave.
  sleep 0.5
  echo It turns out to be a very small cave.
  sleep 0.5
  echo Your eye catches a glint of metal behind a rock.
  sleep 0.5
  echo You have found the magical Sword of Ogoroth!
  sleep 0.5
  echo You discard your silly fountain pen and take the sword with you.
  sleep 0.5
  echo -e "You walk back out to the field.\n"
  CHOOSE_HOUSE_OR_CAVE
}

function CHOOSE_FIGHT (){ 
  # add logic for if armed with the magic weapon. Currently assumes not armed
  echo You do your best...
  sleep 0.5
  echo "but your fountain pen is no match for the tax collector."
  sleep 0.5
  echo You have been defeated!
  sleep 0.5
  WANT_TO_PLAY_AGAIN
}

function WANT_TO_PLAY_AGAIN(){
  echo Would you like to play again? y/n
  read CHOICE
  sleep 0.5
  if [[ $CHOICE == y ]] 
    then echo Excellent! Restarting the game...
    sleep 0.5
    PLAY_GAME
  elif [[ $CHOICE == n ]]
    then echo "Thank you for playing! See you next time."
    sleep 0.5
  else 
    echo "That's not an option."
    sleep 0.5
    WANT_TO_PLAY_AGAIN
  fi

}

function PLAY_GAME () {
  INTRO
  CHOOSE_HOUSE_OR_CAVE
}

PLAY_GAME