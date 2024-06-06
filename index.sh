#!/bin/bash

echo "Welcome to Xmen: "
echo "What do you want to do today?"
echo "Please select an option"
read choice
echo "Hello, You have choosen,  $choice!"

case $choice in
  1)
    echo "You want to add a new record." ;;
  2)
    echo "You want to list all students." ;;
  3)
    echo "You want to delete a student." ;;
  *)
    echo "Invalid input. Please try again" ;;
esac
