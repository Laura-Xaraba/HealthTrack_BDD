#encoding: UTF-8
#language: en-us

@reports @analytics @medical-management
Feature: Reports and Statistics
    As a doctor or administrator,
    I want to view reports and statistics on patient health data,
    So that I can analyze trends, track progress, and make data-driven decisions.

    Background:
        Given the doctor or administrator is logged in 
        And on the reports and statistics page

    @positive @view-report
    Scenario: Successfully view a health report for a patient
        When the doctor/administrator selects patient "Bruce Wayne"
        And clicks the "View Health Report" button
        Then the health report for patient "Bruce Wayne" should be displayed
        And the report should include graphs and tables informing about consultations, prescriptions, and health indicators

    @positive @view-report
    Scenario: Successfully view health statistics for a patient
        When the doctor/administrator selects patient "Bruce Wayne"
        And clicks the "View Health Statistics" button
        Then the health Statistics for patient "Bruce Wayne" should be displayed
        And the statistics should include graphs and tables showing the patient's health and its progression

    @positive @export-PDF
    Scenario: Successfully export a health report to PDF
        Given the doctor/administrator is viewing the health report for patient "Bruce Wayne"
        When the doctor/administrator clicks the "Export to PDF" button
        Then the health report should be exported as a PDF file
        And the doctor/administrator should be able to download the file
        And the report export action should be logged for compliance auditing

    @positive @export-Excel
    Scenario: Successfully export health report to Excel
        Given the doctor/administrator is viewing the health report for patient "Bruce Wayne"
        When the doctor/administrator clicks the "Export to Excel" button
        Then the health statistics should be exported as an Excel file
        And the doctor/administrator should be able to download the file
        And the report export action should be logged for compliance auditing

    @negative @no-report-found
    Scenario: Attempt to view a report when no data is available
        When the doctor/administrator selects patient "Fledermausmann"
        And clicks the "View Health Report" button
        Then an error message should be displayed stating that no health data is available for the selected patient

    @negative @no-statistics-found
    Scenario: Attempt to view statistics when no data is available
        When the doctor/administrator selects patient "Fledermausmann"
        And clicks the "View Health Statistics" button
        Then an error message should be displayed stating that no health statistics are available for the selected patient
