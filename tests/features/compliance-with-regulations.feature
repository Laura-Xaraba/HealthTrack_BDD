#encoding: UTF-8
#language: en-us

@compliance @regulations @security
Feature: Compliance with Regulations
    As a system administrator,
    I want the system to comply with health and security regulations,
    So that patient data is protected and all actions are auditable.

    Background:
        Given the administrator is logged in 
        And on the system compliance page

    @positive @data-encryption
    Scenario: Ensure patient data is encrypted
        Given the patient’s health data is stored in the system
        When the administrator accesses the database
        Then all patient health information should be encrypted and inaccessible in plain text

    @positive @audit-trail
    Scenario: Ensure an audit trail is generated for all user actions
        When the doctor updates patient "Bruce Wayne's" information
        Then an audit entry should be created for this action
        And the audit entry should include the doctor’s name, action type, and timestamp

    @positive @compliance-check
    Scenario: Ensure the system is compliant with health regulations
        Given the system is reviewed for compliance with health regulations (e.g., LGPD)
        When the compliance check is performed
        Then the system should pass the compliance check
        And a compliance certificate should be issued
