#!/bin/bash

echo "Welcome to Xmen"
echo "What do you want to do today? Please select an option"
echo "Select an option (1-5):"
echo "1. Add a student"
echo "2. List all students"
echo "3. Delete student"
echo "4. Update students info"
echo "5. Exit the application"
read choice

# Constants
STUDENTS_FILE="students-list_1023.txt"

# This line of codes create a student and a Unique ID that will be generated for each student
function option1 {
    # unique_id=$(uuidgen)
    unique_id=$(openssl rand -hex 8)
    echo "Hello, You have chosen option 1!"
    echo "Please enter the student's name"
    read name
    echo "Please enter the student's age"
    read age
    echo "Please enter the student's intake"
    read intake
    echo "Please enter the student's email"
    read email
    echo "$unique_id, $name, $age, $intake, $email" >>students-list_1023.txt
    echo "Thank you, $name, $age, $intake, $email have been added to the record with unique ID $unique_id"
}

# This lines of Codes list out all students that we have in our records
function option2 {
    echo "You selected option 2."
    echo "List of all students:"
    echo "----------------------"
    cat -n students-list_1023.txt
    echo "----------------------"
}

# This lines of Codes Delete a student in our record with the use of their ID
function option3 {
    echo "You selected option 3."
    read -p "Enter the ID to delete: " unique_id

    # Search for the record in the file
    record=$(grep -i "$unique_id" students-list_1023.txt)

    # Check if a record was found
    if [ -n "$record" ]; then
        # Prompt the user to confirm the deletion
        read -p "Are you sure you want to delete the record for '$unique_id'? (y/n) " confirm

        # Delete the record if the user confirms
        if [ "$confirm" = "y" ]; then
            grep -v "$unique_id" students-list_1023.txt >temp_file.txt
            mv temp_file.txt students-list_1023.txt
        else
            echo "Deletion cancelled."
        fi
    else
        echo "No record found for '$unique_id'."
    fi
}

find_student() {
    local id="$1"
    local line=$(grep -m 1 "^$id" "$STUDENTS_FILE")
    echo "$line"
}

# Function to update a student's information
update_student() {
    read -p "Enter the student ID to update: " id

    local line=$(find_student "$id")
    if [ -z "$line" ]; then
        echo "Student with ID $id not found."
        return 1
    fi

    local currentName=$(echo "$line" | cut -d, -f2)
    local currentDob=$(echo "$line" | cut -d, -f3)
    local currentGradYear=$(echo "$line" | cut -d, -f4)
    local currentEmail=$(echo "$line" | cut -d, -f5)

    echo "Current student information:"
    echo "Name: $currentName"
    echo "Date of Birth: $currentDob"
    echo "Graduation Year: $currentGradYear"
    echo "Email: $currentEmail"

    read -p "Enter new name (leave blank to keep current): " newName
    read -p "Enter new date of birth (leave blank to keep current): " newDob
    read -p "Enter new graduation year (leave blank to keep current): " newGradYear
    read -p "Enter new email (leave blank to keep current): " newEmail

    local newName="${newName:-$currentName}"
    local newDob="${newDob:-$currentDob}"
    local newGradYear="${newGradYear:-$currentGradYear}"
    local newEmail="${newEmail:-$currentEmail}"
    local newLine="$id, $newName, $newDob, $newGradYear, $newEmail"
    sed -i "" "s/^$id.*/$newLine/" $STUDENTS_FILE
    echo "Student with ID $id updated."
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
    update_student
    ;;
5)
    option5
    ;;

*)
    default_option
    ;;
esac
