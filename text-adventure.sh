#!/bin/bash

# Translating my python text adventure game to shell :D 
# to-do:
  # add logcic to play slightly different weapong/victory sequence depending on the weapon - maybe
  # replace MIGHTY ARMORY contents with better weapon names

CADRE_OF_VILLAINS=("tax collector" "evil oceanographer" "inept but evil pirate" "baby shark")
DINKY_WEAPONS=("fountain pen" "dagger" "umbrella" "paintbrush" "magnifying glass")
MIGHTY_ARMORY=("magical Sword of Ogoroth" "mystical WEAPON 2 - TBD" "miraculous WEAPON 3 - TBD" "pugnacious Pug from Pugnasia")

function ECHO_PAUSE (){
  echo -e "$1"
  sleep 0.5
}

function INTRO (){
  ECHO_PAUSE "You find yourself standing in a meadow with grass and wild flowers."
  ECHO_PAUSE "Rumor has it that a $VILLAIN is somewhere around here, and has been terrifying the nearby villagers."
  ECHO_PAUSE "In front of you is a house."
  ECHO_PAUSE "In your hand you hold your trusty (but ineffective, given the circumstances) $WIMPY_WEAPON.\n"
}

function CHOOSE_HOUSE_OR_CAVE () {
  ECHO_PAUSE "Enter 1 to knock on the door of the house."
  ECHO_PAUSE "Enter 2 to peer into the cave."
  ECHO_PAUSE "What would you like to do?"
  ECHO_PAUSE "(Please enter 1 or 2.)"
  read CHOICE  
  if [[ $CHOICE == 1 ]] 
    then KNOCK_DOOR 
  elif [[ $CHOICE == 2 ]]
    then CHOOSE_CAVE 
  else 
    ECHO_PAUSE "That\'s not an option."
    CHOOSE_HOUSE_OR_CAVE 
  fi
}

function KNOCK_DOOR () {
  ECHO_PAUSE "You approach the door of the house."
  ECHO_PAUSE "You are about to enter and out steps the $VILLAIN."
  ECHO_PAUSE "Eep! This is the $VILLAIN's house!"
  ECHO_PAUSE "The $VILLAIN attacks you!"
  if [[ $ARMED_WITH != $MIGHTY_WEAPON ]]
    then ECHO_PAUSE "You feel a little under-prepared, what with only having a $WIMPY_WEAPON."
  fi
  ECHO_PAUSE "Would you like to (1) fight or (2) run away?"
  read CHOICE
  if [[ $CHOICE == 1 ]]
    then CHOOSE_FIGHT
  elif [[ $CHOICE == 2 ]]
    then 
      ECHO_PAUSE "You run back into the field."
      ECHO_PAUSE "Luckily, you don't seem to have been followed.\n"
      CHOOSE_HOUSE_OR_CAVE
  else 
    ECHO_PAUSE "That's not an option."
    CHOOSE_HOUSE_OR_CAVE
  fi
}

function CHOOSE_CAVE () {
  if [[ $ARMED_WITH == $MIGHTY_WEAPON ]]
  then 
    ECHO_PAUSE "You've been here before, and gotten all the good stuff. It's just an empty cave now. You walk back out to the field.\n"
    CHOOSE_HOUSE_OR_CAVE
  else  
    ECHO_PAUSE "You peer cautiously into the cave."
    ECHO_PAUSE "It turns out to be a very small cave."
    ECHO_PAUSE "Your eye catches a glint of metal behind a rock."
    ECHO_PAUSE "You have found the $MIGHTY_WEAPON!"
    ARMED_WITH+=$MIGHTY_WEAPON
    ECHO_PAUSE "You discard your silly $WIMPY_WEAPON and take the sword with you."
    ECHO_PAUSE "You walk back out to the field.\n"
    CHOOSE_HOUSE_OR_CAVE
  fi
}

function CHOOSE_FIGHT (){ 
  if [[ $ARMED_WITH == $MIGHTY_WEAPON ]]
    then
      ECHO_PAUSE "As the $VILLAIN moves to attach, you ready your new weapon." 
      ECHO_PAUSE "$ARMED_WITH shines brightly in your hand as you brace yourself for the attach."
      ECHO_PAUSE "But the $VILLAIN takes one look at your shiny new toy and runs away!"
      ECHO_PAUSE "You have rid the town of the $VILLAIN. You are victorious!"
      WANT_TO_PLAY_AGAIN
  else
    ECHO_PAUSE "You do your best..."
    ECHO_PAUSE "but your $WIMPY_WEAPON is no match for the $VILLAIN."
    ECHO_PAUSE "You have been defeated!"
    WANT_TO_PLAY_AGAIN
  fi
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
  # Setting our variables: wimpy weapon, mighy weapon, villain
  WIMPY_WEAPON=${DINKY_WEAPONS[$(( RANDOM % 5 ))]}
  MIGHTY_WEAPON=${MIGHTY_ARMORY[$(( RANDOM % 4 ))]}
  VILLAIN=${CADRE_OF_VILLAINS[$(( RANDOM % 4 ))]}
  ARMED_WITH=""
  
  # play the game
  INTRO
  CHOOSE_HOUSE_OR_CAVE
}

PLAY_GAME