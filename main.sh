#!/bin/bash

echo "Welcome to Xmen "
echo "What do you want to do today? Please select an option"
echo "Select an option (1-3):"
echo "1. Add a student"
echo "2. List all students"
read choice

function option1 {
  echo "Hello, You have choosen, $choice!"
  echo "Please enter the students name"
  read name
  echo "Please enter the students age"
  read age
  echo "Please enter the students intake"
  read intake
  echo "Please enter your email"
  read email
  echo "$name, $age, $intake, $email" >> students-list_1023.txt
  echo "Thank you, $name have been added to the record"
}

function option2 {
  echo "You selected option 2."
}

function option3 {
  echo "You selected option 3."
}

function default_option {
  echo "Invalid option selected...Please start again"
}

case $choice in
  1)
    option1
    ;;
  2)
    option2
    ;;
  3)
    option3
    ;;
  *)
    default_option
    ;;
esac
