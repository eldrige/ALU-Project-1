#!/bin/bash

echo "Welcome to Xmen"
echo "What do you want to do today? Please select an option"
echo "Select an option (1-5):"
echo "1. Add a student"
echo "2. List all students"
echo "3. Delete student"
echo "4. Update file"
echo "5. Exit the application"
read choice

function option1 {
    unique_id=$(uuidgen)
    echo "Hello, You have chosen option 1!"
    echo "Please enter the student's name"
    read name
    echo "Please enter the student's age"
    read age
    echo "Please enter the student's intake"
    read intake
    echo "Please enter the student's email"
    read email
    echo "$unique_id, $name, $age, $intake, $email" >> students-list_1023.txt
    echo "Thank you, $name, $age, $intake, $email have been added to the record with unique ID $unique_id"
}

function option2 {
    echo "You selected option 2."
    echo "List of all students:"
    cat students-list_1023.txt
}

function option3 {
  echo "You selected option 3."
    read -p "Enter the email to delete: " email

    # Search for the record in the file
    record=$(grep -i "$email" students-list_1023.txt)

    # Check if a record was found
    if [ -n "$record" ]; then
        # Prompt the user to confirm the deletion
        read -p "Are you sure you want to delete the record for '$email'? (y/n) " confirm

        # Delete the record if the user confirms
        if [ "$confirm" = "y" ]; then
            grep -v "$email" students-list_1023.txt > temp_file.txt
            mv temp_file.txt students-list_1023.txt
        else
            echo "Deletion cancelled."
        fi
    else
        echo "No record found for '$email'."
    fi
}
  
function option4 {
  echo "You selected option 4."
  echo "enter the student you want to update"
  grep -v "$email" students-list_1023.txt
  sed 's/old_text/new_text/g' students-list_1023.txt
  echo "You have updated the text"
  }

function option5 {
  echo "You selected option 5."
  echo "You are exiting, Good Bye"
  exit
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
    4)
        option4
        ;;
    5)
        option5
        ;;

    *)
        default_option
        ;;
esac
