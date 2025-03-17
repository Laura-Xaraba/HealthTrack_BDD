#encoding: UTF-8
#language: en-us

@prescriptions @medical-management
Feature: Prescription Management
  As a doctor,
  I want to create, edit, and delete prescriptions for patients,
  So that I can provide the correct treatment and medication.

    Background:
        Given the doctor is logged in
        And on the prescription management page

    @positive @create-prescription
    Scenario: Successfully create a prescription for a patient
        When the doctor selects patient "Bruce Wayne"
        And enters the medication name "Ibuprofen"
        And the madication is approved
        And enters the dosage "200mg"
        And enters the frequency "Twice a day"
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then the prescription should be created successfully
        And a confirmation message should be displayed

    @negative @invalid-medication
    Scenario: Attempt to create a prescription with an invalid medication
        When the doctor selects patient "Bruce Wayne"
        And enters the medication name "InvalidMed"
        And the madication is not approved
        And enters the dosage "200mg"
        And enters the frequency "Twice a day"
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the medication is not approved

    @negative @invalid-dosage
    Scenario: Attempt to create a prescription with an invalid dosage
        When the doctor selects patient "Bruce Wayne"
        And enters the medication name "Ibuprofen"
        And enters the dosage "3000mg"
        And enters the frequency "Twice a day"
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the dosage is invalid

    @negative @missing-patient-name-field
    Scenario: Attempt to create a prescription without informing the patient name
        When the doctor leave the patient name field empty
        And enters the medication name "Ibuprofen"
        And enters the dosage "200mg"
        And enters the frequency "Twice a day"
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the patient name is required

    @negative @missing-medication-name-field
    Scenario: Attempt to create a prescription without informing medication name 
        When the doctor selects patient "Bruce Wayne"
        And leaves the madication name field empty
        And enters the dosage "200mg"
        And enters the frequency "Twice a day"
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the medication name is required
    
    @negative @missing-dosage-field
    Scenario: Attempt to create a prescription without informing the dosage
        When the doctor selects patient "Bruce Wayne"
        And enters the medication name "Ibuprofen"
        And leaves the dosage field empty
        And enters the frequency "Twice a day"
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the dosage is required

    @negative @missing-frequency-field
    Scenario: Attempt to create a prescription without informing the frequency
        When the doctor selects patient "Bruce Wayne"
        And enters the medication name "Ibuprofen"
        And enters the dosage "200mg"
        And leaves the frequency field empty
        And enters the duration "7 days"
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the frequency should be informed

    @negative @missing-frequency-field
    Scenario: Attempt to create a prescription without informing the duration
        When the doctor selects patient "Bruce Wayne"
        And enters the medication name "Ibuprofen"
        And enters the dosage "200mg"
        And enters the frequency "Twice a day"
        And leaves the duration field empty
        And clicks the "Create Prescription" button
        Then an error message should be displayed stating that the duration should be informed

    @positive @delete-prescription
    Scenario: Successfully delete a prescription
        Given the doctor has created a prescription for patient "Bruce Wayne"
        When the doctor selects the prescription "Ibuprofen"
        And clicks the "Delete" button
        Then the prescription should be deleted successfully
        And a confirmation message should be displayed

    @positive @edit-prescription
    Scenario: Successfully delete a prescription
        Given the doctor has created a prescription for patient "Bruce Wayne"
        When the doctor selects the prescription "Ibuprofen"
        And clicks the "Edit" button
        And edits the dosage to "600mg"
        And clicks the "Save" button
        Then the prescription should be edited successfully
        And a confirmation message should be displayed