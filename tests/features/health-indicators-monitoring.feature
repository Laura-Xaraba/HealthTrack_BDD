#encoding: UTF-8
#language: en-us

@health-indicators @patient-management
Feature: Health Indicators Monitoring
    As a patient,
    I want to record my health indicators (e.g., blood pressure, blood sugar, weight),
    So that I can track my health progress over time and share it with my doctor.

    Background:
        Given the patient is logged in 
        And on the health indicators monitoring page

    @positive @record-indicator
    Scenario: Successfully record a health indicator
        When the patient enters the indicator "Blood Pressure"
        And enters the value "120/80"
        And selects the date "2025-03-20"
        And clicks the "Save" button
        Then the health indicator should be recorded successfully
        And a confirmation message should be displayed
        And the patient's consent for the health data collection should be recorded

    @positive @indicator-out-of-range
    Scenario: Record a health indicator with an out-of-range value
        When the patient enters the indicator "Blood Sugar"
        And enters the value "300 mg/dL"
        And selects the date "2025-03-20"
        And clicks the "Save" button
        Then the health indicator should be recorded successfully
        And the patient's consent for the health data collection should be recorded
        And an alert should be displayed notifying that the blood sugar is out-of-range
        And the doctor should be notified that the patient health indicator is abnormal

    @negative @missing-indicator
    Scenario: Attempt to record a health indicator without selecting the indicator type
        When the patient leaves the indicator field empty
        And enters the value "120/80"
        And selects the date "2025-03-20"
        And clicks the "Save" button
        Then an error message should be displayed stating that the indicator type is required

    @negative @missing-value
    Scenario: Attempt to record a health indicator without entering a value
        When the patient enters the indicator "Blood Pressure"
        And leaves the value field empty
        And selects the date "2025-03-20"
        And clicks the "Save" button
        Then an error message should be displayed stating that the value is required

    @positive @view-indicator-trends
    Scenario: View trends for recorded health indicators
        Given the patient has recorded multiple health indicators over time
        When the patient clicks the "View Trends" button
        And is authorized to access teh data
        Then the system should display a graph showing the trend of the recorded indicators over time
        And the patient should be able to view the data in both chart and table formats

    @positive @health-indicator-not-updated
    Scenario: Doesn't update health indicator at the stipulated interval
        Given the patient has not updated the indicator in the recommended time interval
        When the patient clicks the "View Trends" button
        Then the system should display a message stating that the health indicators need to be updated more frequently
        And the patient should be redirected to the health indicators recording page
