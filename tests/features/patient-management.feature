#encoding: UTF-8
#language: en-us

@patient-management @medical-management
Feature: Patient Management
    As a doctor,
    I want to manage patient information,
    So that I can provide the best possible care and maintain accurate health records.

    Background:
        Given the doctor is logged in 
        And on the patient management page

    @positive @view-patient
    Scenario: Successfully view patient information
        Given the doctor is authorized to view patient "Bruce Wayne"
        When the doctor selects patient "Bruce Wayne"
        Given the doctor is authorized to view patient "Bruce Wayne"
        Then the patient's information should be displayed
        And the doctor should be able to view the patient's health records, medications, and past consultations

    @positive @update-patient-info
    Scenario: Successfully update patient information
        Given the doctor is authorized to view patient "Bruce Wayne"
        When the doctor selects patient "Bruce Wayne"
        And updates the phone number to "(12)34567-8900"
        And clicks the "Save" button
        Then the patient information should be updated successfully
        And a confirmation message should be displayed

    @negative @unauthorized-access
    Scenario: Attempt to view patient information without authorization
        Given the doctor is not authorized to view patient "Bruce Wayne"
        When the doctor selects patient "Bruce Wayne"
        Then access to the patient's sensitive data should be denied
        And error message should be displayed stating that the doctor is not authorized to access this patient's information
        And the administration should be informed about the unauthorized attempt

    @positive @send-message-to-patient
    Scenario: Successfully send a message to a patient
        Given the doctor is authorized to view patient "Bruce Wayne"
        When the doctor selects patient "Bruce Wayne"
        And types the message "Please schedule a follow-up appointment"
        And clicks the "Send Message" button
        Then the message should be sent successfully
        And a confirmation message should be displayed
        And the modification action should be logged for compliance auditing

    @negative @delete-patient-info
    Scenario: Attempt to delete patient information
        Given the doctor is authorized to view patient "Bruce Wayne"
        When the doctor selects patient "Bruce Wayne"
        And clicks the "Delete Patient" button
        Then a confirmation prompt should appear asking for confirmation to delete the patient information
        When the doctor confirms the deletion
        Then the patient information should be deleted successfully
        And a confirmation message should be displayed
        And the modification action should be logged for compliance auditing
