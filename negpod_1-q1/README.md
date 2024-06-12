//////////////////////////////////ALU PROJECT DOCUMENTATION///////////////////////////////
// //
// \* _ WELCOME _ _ //
// _ \* //
//////////////////////////////////////////////////////////////////////////////////////////

Table of Contents

I. Introduction
II. Project Description
III. Project Use
IV. Credits
====================================

---

## I. INTRODUCTION

This readme file contains all the information you need in order to use the programs as well as an overview of the functions each shell script can perform.

---

## II. PROJECT DESCRIPTION

This project was created to register and manage the details of students into the ALU registration system, specifically for the Engineering cohort list of students. The application takes user input and creates or updates the cohort list, which is saved as 'students-list_1023.txt'.

---

## III. PROJECT USE

-------MAIN.SH---------

The application main.sh is the main program used for the management of the cohort list.
Upon execution of the application, the user will be greeted by the application and will be prompted to choose from a selection of options that can be done within the program, namely:

Option 1 - Adding/creating a student record
The application will prompt the user to input a number of details, namely the name, age, intake and email respectively. The application will then uppdate the student list and output the information to the user.

Option 2 - Listing all of the students
The application will output a full list of all the students

Option 3 - Deleting a single student record
The application will prompt the user to input the student email of the student they wish to delete. A confirmation of the task will then be shown in the form of a y/n input, which upon the user inputing their choice will delete the chosen student's record.

Option 4 - Updating a student record
The application requests the student's ID, which after confirming its existence on the student list, will request the user to input the students **\*\***

Option 5 - Exiting the application
The application will close.

----SELECTEMAILS.SH----

This application aims to extract the student emails of every student from the student list and save them in a seperate file named student_emails.txt

----MOVETODIRECTORY.SH----

This application aims to move all the files in the current folder/directory into a folder named "negpod_1-q1"
Upon execution, if the moving of files was successful then a text will pop up confirming the operation.

----BACKUP-NEGPOD_1.SH----

This application aims to create a backup of a folder/directory named "negpod_1-q1" to a remote server computer.
Upon execution, if the moving of files was successful then a text will pop up confirming the operation.

---

## IV. CREDITS

Big thanks to these individuals for their collective effort for mqking this poject possible:

- Apoh Eldrige
- Precious Chibundu Mozia
- Chinemerem Ugbo
- Ewing Singa Saragba
- Simeon Akhigbe
- Wakhile Dlamini
- Sibahle Sacaba Dlamini
