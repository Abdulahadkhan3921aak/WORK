# javafx-gradle-template

A template Java project simple applications using gradle and basic dependencies. It comes with:
- a JavaFX demo for a Graphical User Interface (GUI)
- a Command Line Interface (CLI) applications
- an SQL databse to load and store Books (in the GUI application) 
- a CSV file demo to load and store Books (in the CLI application)

Mix and match as needed.

📼 This video shows how to [run and import the project in Eclipse](https://youtu.be/9bqYSYh-G1A)

It basically follows the tutorial described here: https://openjfx.io/openjfx-docs/#gradle

The example dependency that reads a CSV file is based on another tutorial here: https://www.callicoder.com/java-read-write-csv-file-apache-commons-csv/

# Simple Banking Application

## Overview

This simple banking application is developed using Java and is designed to demonstrate basic banking operations such as account management, depositing money, withdrawing money, and checking account balance. The application provides both Command Line Interface (CLI) and Graphical User Interface (GUI) interfaces for user interaction.

## Project Structure

The project consists of the following main components:

_src/main/java/de/buw/se/:_ This directory contains Java source code files for the application

_AppCLI.java:_ Implements the Command Line Interface (CLI) for the banking application

_AppGUI.java:_ Implements the Graphical User Interface (GUI) for the banking application

_DataStoreCsv.java:_ Provides functionality to read and modify account data from a CSV file

_DataStoreSql.java:_ Provides functionality to read and modify account data from an H2 database

_Prompt.java:_ Implements a prompt for displaying messages in the GUI

## Functionality

### The application provides the following functionalities:

### CLI Interface (AppCLI.java):

- Display the account balance.
- Deposit money into the account.
- Withdraw money from the account.

### GUI Interface (AppGUI.java):

- Display the account balance.
- Deposit money into the account.
- Withdraw money from the account.

## Getting Started

### To run the application, follow these steps:

- Clone the repository to your local machine.
- Open the project in your preferred Java IDE (e.g., IntelliJ IDEA, Eclipse).
- Choose the desired interface (CLI or GUI) to interact with the banking application.
- Build and run the project.

## Dependencies

Apache Commons CSV: Used for reading and writing CSV files.

H2 Database: Embedded database used for storing account data.

## Contributors

### Group P:

Klaurent Madhi

Nikolai Maklakov

Abdul Rahman

# H2 database connection
Download and install: https://www.h2database.com/html/main.html

Run downloaded application

Insert the following value into `JDBC URL` textbox:

```
jdbc:h2:{path to db file}
```
remove .mv.db from db file path