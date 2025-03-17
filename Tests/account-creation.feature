#encoding: UTF-8
#language: en-us

Feature: Account Creation
    As a new user,
    I want to create an account,
    So that I can access the HealthTrack system and manage my health data.

    Background:
        Given the user is on teh registration page
        And is not registered in the system


    @positive @valid-data
    Scenario: Successfully create an account with valid data
        When the user enters username "user123"
        And enters email "user@email.com"
        And enters password "Password@123"
        And enters age "25"
        And clicks the "Create Account" button
        Then the account should be created successfully
        And a confirmation message should be displayed

    @negative @invalid-password
    Scenario: Attempt to create an account with an invalid password
        When the user enters username "user123"
        And enters email "user@email.com"
        And enters password "password123"
        And enters age "25"
        And clicks the "Create Account" button
        Then an error message should be displayed stating that the password must be between 8 and 12 characters long and include at least one number and one special character

    @negative @invalid-age
    Scenario: Attempt to create an account with an age outside the allowed range
        When the user enters username "user123"
        And enters email "user@email.com"
        And enters password "Password@123"
        And enters age "15"
        And clicks the "Create Account" button
        Then an error message should be displayed stating that the age must be between 18 and 100

    @negative @invalid-email
    Scenario: Attempt to create an account with an invalid email format
        When the user enters username "user123"
        And enters email "user-email.com"
        And enters password "Password@123"
        And enters age "25"
        And clicks the "Create accout" button
        Then an error message should be displayed stating that the email must be in a valid format

    @negative @password-length
    Scenario: Attempt to create an account with a password outside the required length
        When the user enters username "user123"
        And enters email "user@email.com"
        And enters password "PW@123"
        And enters age "25"
        And clicks the "Create Account" button
        Then an error message should be displayed stating that the password must be between 8 and 12 characters