# HealthTrack BDD

## 📌 Overview

HealthTrack BDD is a test automation repository using Behavior-Driven Development (BDD) with Gherkin. This project validates critical business rules for a healthcare system, ensuring compliance with regulations and proper system functionality.

## 📁 Project Structure

```
HealthTrack_BDD
|
|__ tests
        |__ features
                   |__ account-creation.feature
                   |__ appointment-scheduling.feature
                   |__ compliance-with-regulations.feature
                   |__ health-indicators-monitoring.feature
                   |__ login.feature
                   |__ patient-management.feature
                   |__ prescription-management.feature
                   |__ reports-and-statistics.feature
```

## 🏥 Business Rules & Feature Descriptions

### 1️⃣ **Account Creation**

- Users must provide valid personal details for account creation.
- Email verification is required before first login.
- Password must meet security requirements (e.g., min. 8 characters, special characters, etc.).

### 2️⃣ **Login**

- Registered users can log in with valid credentials.
- Three failed attempts trigger a temporary lockout.
- Multi-factor authentication (MFA) is required for high-privilege accounts.

### 3️⃣ **Appointment Scheduling**

- Patients can book appointments based on doctor availability.
- Double-booking prevention is enforced.
- Cancellations and reschedules follow predefined time limits.

### 4️⃣ **Compliance with Regulations**

- Ensures the system meets healthcare regulatory standards.
- Patient data is encrypted and securely stored.
- Access to medical records follows role-based permissions.

### 5️⃣ **Health Indicators Monitoring**

- Patients can track vital signs like heart rate, blood pressure, etc.
- Alerts are triggered for abnormal values.
- Historical data visualization is available.

### 6️⃣ **Patient Management**

- Doctors and admins can update patient records.
- Only authorized personnel can access sensitive patient information.
- Patient history is immutable to prevent data tampering.

### 7️⃣ **Prescription Management**

- Doctors can prescribe medication based on diagnosis.
- Digital prescriptions must include dosage and duration.
- Only licensed professionals can issue prescriptions.

### 8️⃣ **Reports & Statistics**

- System generates reports on patient trends and health insights.
- Data aggregation follows anonymization protocols.
- Admins can filter reports by date, category, and patient demographics.

## 🚀 How to Run Tests

Ensure you have the necessary dependencies installed before executing tests.

```sh
# Run all feature tests
cucumber-js tests/features

# Run a specific feature file
cucumber-js tests/features/login.feature
```

## Notes

- This repository focuses exclusively on the BDD scenarios.
- Test execution depends on a configured test runner (e.g., Cucumber, Behave, etc.).
- Ensure the test environment meets system requirements for accurate validation.

---

For any inquiries, feel free to reach out!
