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
    echo "$unique_id, $name, $age, $intake, $email" >>students-list_1023.txt
    echo "Thank you, $name, $age, $intake, $email have been added to the record with unique ID $unique_id"
}

function option2 {
    echo "You selected option 2."
    echo "List of all students:"
    echo "---------------------"

    # Display the contents of the students-list_1023.txt file
    # with line numbers for better readability
    cat -n students-list_1023.txt

    echo "---------------------"
}

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

function option4() {
    echo "Enter the student ID to update:"
    read student_id_to_update

    # Check if the student record exists
    if ! grep -q "$student_id_to_update" "$STUDENTS_FILE"; then
        echo "Student record not found."
        return
    fi

    # Retrieve the current values for the student
    current_record=$(grep "$student_id_to_update" "$STUDENTS_FILE")
    IFS=',' read -r current_email current_age current_student_id <<<"$current_record"

    echo "Current email: $current_email"
    echo "Current age: $current_age"

    echo "Enter new email (leave blank to keep current):"
    read new_email
    echo "Enter new age (leave blank to keep current):"
    read new_age

    # Use the new values if provided, otherwise keep the current values
    if [ -n "$new_email" ]; then
        updated_email="$new_email"
    else
        updated_email="$current_email"
    fi

    if [ -n "$new_age" ]; then
        updated_age="$new_age"
    else
        updated_age="$current_age"
    fi

    # Create a temporary file to store the updated list
    temp_file=$(mktemp)

    # Update the record with the new data
    while IFS=',' read -r email age student_id; do
        if [ "$student_id" == "$student_id_to_update" ]; then
            echo "$updated_email,$updated_age,$student_id" >>"$temp_file"
        else
            echo "$email,$age,$student_id" >>"$temp_file"
        fi
    done <"$STUDENTS_FILE"

    # Overwrite the original file with the updated list
    mv "$temp_file" "$STUDENTS_FILE"
    echo "Student record updated successfully."
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
