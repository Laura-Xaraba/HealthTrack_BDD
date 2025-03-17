#encoding: UTF-8
#language: en-us

@appointments @user-management
Feature: Appointment Scheduling
    As a registered user,
    I want to schedule an appointment with a doctor,
    So that I can receive medical care and advice.

    Background:
    Given the user is logged in 
    And on the appointment scheduling page

    @positive @valid-appointment
    Scenario: Successfully schedule an appointment with a doctor
        When the user selects doctor "Dr. Smith"
        And the doctor selected is avaliable
        And selects the date "2025-03-20"
        And selects the time "10h00"
        And selects the appointment type "In-person"
        And clicks the "Schedule Appointment" button
        Then the appointment should be scheduled successfully
        And a confirmation message should be displayed

    @negative @doctor-unavailable
    Scenario: Attempt to schedule an appointment with an unavaliable doctor
        When the user selects doctor "Dr. Smith"
        And the doctor selected is not avaliable
        And selects the date "2025-03-20"
        And selects the time "10h00"
        And selects the appointment type "In-person"
        And clicks the "Schedule Appointment" button
        Then an error message should be displayed stating that the doctor is unavailable at the selected time

    @negative @outside-business-hours
    Scenario: Attempt to schedule an appointment outside business hours
        When the user selects doctor "Dr. Smith"
        And the doctor selected is avaliable
        And selects the date "2025-03-20"
        And selects the time "19h00"
        And selects the appointment type "In-person"
        And clicks the "Schedule Appointment" button
        Then an error message should be displayed stating that appointments can only be scheduled between 08h00 and 18h00
    
    @negative @missing-doctor-field
    Scenario: Attempt to schedule an appointment without selecting an appointment type
        When the user leaves the doctor selector empty
        And selects the date "2025-03-20"
        And selects the time "10h00"
        And selects the appointment type "In-person"
        And clicks the "Schedule Appointment" button
        Then an error message should be displayed stating that the doctor must be selected

    @negative @missing-date-field
    Scenario: Attempt to schedule an appointment with missing fields
        When the user selects doctor "Dr. Smith"
        And the doctor selected is avaliable
        And leaves the date field empty
        And selects the time "10h00"
        And selects the appointment type "In-person"
        And clicks the "Schedule Appointment" button
        Then an error message should be displayed stating that the date is required
    
    @negative @missing-time-field
    Scenario: Attempt to schedule an appointment without selecting an appointment type
        When the user selects doctor "Dr. Smith"
        And selects the date "2025-03-20"
        And leaves the time field empty
        And selects the appointment type "In-person"
        And clicks the "Schedule Appointment" button
        Then an error message should be displayed stating that the appointment time is required

    @negative @missing-type-field
    Scenario: Attempt to schedule an appointment without selecting an appointment type
        When the user selects doctor "Dr. Smith"
        And the doctor selected is avaliable
        And selects the date "2025-03-20"
        And selects the time "10h00"
        And leaves the appointment type field empty
        And clicks the "Schedule Appointment" button
        Then an error message should be displayed stating that the appointment type must be selected
    