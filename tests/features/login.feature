#encoding: UTF-8
#language: en-us

@authentication @user-management
Feature: User Login
    As a registered user,
    I want to log in to the HealthTrack system,
    So that I can access my health data and manage my appointments.

    Background: 
        Given the user is on the login page
        And is registered

    @positive @valid-credentials
    Scenario: Successfully log in with valid credentials
        When the user enters username "user123"
        And enters password "Password@123"
        And clicks the "Login" button
        Then the user shoud be logged in successfully
        And the dashboard page should be displayed

    @negative @invalid-credentials
    Scenario: Attempt to log in with invalid username or password
        When the user enters username "user123"
        And enters password "Wrong@123"
        And clicks the "Login" button
        Then an error message should be displayed stating that the username or password is incorrect

    @negative @account-lockout
    Scenario: Attempt to log in after three failed attempts
        Given the user has failed to log in two consecutive times
        When the user enters username "user123"
        And enters password "Wrong@123"
        And clicks the "Login" button
        Then the account should be locked for 15 minutes
        And an error message should be displayed stating that the account is temporarily locked
        And an email should be sent to the address registered in the account from which the login attempt was made

    @negative @empty-fields
    Scenario: Attempt to log in with empty username or password
        When the user enters an empty username
        And enters password "Password@123"
        And clicks the "Login" button
        Then an error message should be displayed stating that the username is required

    @negative @empty-password
    Scenario: Attempt to log in with an empty password
        When the user enters username "user123"
        And enters an empty password
        And clicks the "Login" button
        Then an error message should be displayed stating that the password is required

    