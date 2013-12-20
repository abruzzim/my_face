#!/bin/bash #-vx

set -e

# Filename:  rake_create_migrations.sh
# Directory: /Users/abruzzim/Documents/ga_wdi/personal/Source/bash
# Version:   1-001
# Date:      18-Dec-2013
# Author:    Mario Abruzzi
# Descript:  Create Rake Migration files for dogs_and_people HW
# Usage:     ./rake_create_migrations.sh [people | dogs | toys]

# Define Bash Symbols

faci="RAKE_CREATE_MIGRATIONS"

# Check for a valid P1

if [ "${1}" == "" ]; then
  seve="F"
  iden="NOP1"
  text="Null is not valid. Specify \"people\", \"dogs\" or \"toys\". Exiting Bash Script."
  echo ""
  echo "%${faci}-${seve}-${iden}, ${text}"
  echo ""
  exit 1
fi

if [ "${1}" != "people" ] && [ "${1}" != "dogs" ] && [ "${1}" != "toys" ]; then
  seve="F"
  iden="INVP1"
  text="Parameter \"${1}\" is not valid. Specify \"people\", \"dogs\" or \"toys\". Exiting Bash Script."
  echo ""
  echo "%${faci}-${seve}-${iden}, ${text}"
  echo ""
  exit 1
fi

# Rake dogs_and_people Migration Bash Menu

orig_PS3=$PS3 # Save the existing value of PS3

PS3="Select Option (RETURN to list all options): "
select option in "Create PSQL database \"dogs_and_people_db\"" \
                 "Create Rake Migrations for \"people\" table" \
                 "Create Rake Migrations for \"dogs\" table" \
                 "Create Rake Migrations for \"toys\" table" \
                 "Drop PSQL database \"dogs_and_people_db\"" \
                 "Run Rake Migration" \
                 "Display Columns in \"dogs_and_people_db\"" \
                 "Help" \
                 "Quit"

do

  if [ "$REPLY" == "quit" ] || [ "$REPLY" == 9 ]; then
    # The 'break' must precede all other conditional checks.
    seve="I"
    iden="EXIT"
    text="Exiting Bash Script."
    echo ""
    echo "%${faci}-${seve}-${iden}, ${text}"
    echo ""
    break # Exit the loop.
  fi

  if [ "$REPLY" == "help" ]; then
    # User help section.
    echo "Create PSQL database \"dogs_and_people_db\"."
    echo "Create Rake Migrations for \"people\" table."
    echo "Create Rake Migrations for \"dogs\" table."
    echo "Create Rake Migrations for \"toys\" table."
    echo "Drop PSQL database \"dogs_and_people_db\"."
    echo "Run Rake Migration and then display tables."
    echo "Display All Columns in \"dogs_and_people_db\""
    continue # Go back to the start of the loop.
  fi

  if [ ! -z "$option" ]; then # If the string is not zero length, then...

    echo "Option ${REPLY} was selected, which is ... "

    case $REPLY in
      1) echo "Creating PSQL database \"dogs_and_people_db\"..."
          psql --list
          psql --command="CREATE DATABASE dogs_and_people_db;"
          psql --list
          ;;
      2) echo "Creating Rake Migrations for \"people\" table..."
          rake db:create_migration NAME=create_table_people
          #rake db:create_migration NAME=create_col_name_to_people
          ;;
      3) echo "Creating Rake Migrations for \"dogs\" table..."
          rake db:create_migration NAME=create_table_dogs
          #rake db:create_migration NAME=create_col_name_to_dogs
          #rake db:create_migration NAME=create_col_breed_to_dogs
          ;;
      4) echo "Creating Rake Migrations for \"toys\" table..."
          rake db:create_migration NAME=create_table_toys
          #rake db:create_migration NAME=create_col_toy_type_to_toys
          ;;
      5) echo "Dropping PSQL database \"dogs_and_people_db\"..."
          psql --list
          psql --command="DROP DATABASE dogs_and_people_db;"
          psql --list
          ;;
      6) echo "Run Rake Migration for \"dogs_and_people_db\"..."
          rake db:migrate
          psql --command="\d" dogs_and_people_db
          ;;
      7) echo "Display columns for \"dogs_and_people_db\"..."
          psql --command="SELECT * FROM people;" dogs_and_people_db
          psql --command="SELECT * FROM dogs;" dogs_and_people_db
          psql --command="SELECT * FROM toys;" dogs_and_people_db
          ;;
    esac

  else

    seve="E"
    iden="INVOPT"
    text="${REPLY} is not a valid menu option."
    echo ""
    echo "%${faci}-${seve}-${iden}, ${text}"
    echo ""

  fi

done

PS3=$orig_PS3 # Restore the original value of PS3

exit 0
