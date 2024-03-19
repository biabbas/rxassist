# Project Setup Guide

This guide provides instructions on how to set up and run the project locally. Follow these steps to get started with the project.

## Prerequisites

- Python 3.11.8
- virtualenv 20.25.0
- MySQL
- pkg-config 0.29.2

## Setup Instructions

1. **Install Python:**
   - Ensure Python 3.11.6 is installed on your system. If not, download and install Python from [python.org](https://www.python.org/).

2. **Install MySQL and Configure it:**
   - Install MySQL on your system following the instructions provided by MySQL's official documentation.
   - Update database information in `rx-assist/rx-assist/settings.py` if necessary.
   - By default, this project connects to MySQL as the root user without requiring a password.

3. **Create Database and Import Tables:**
   - Create a new database in MySQL.
     ```
     mysql create database rx_db
     ```
   - Import tables using `rxdb.sql`:
     ```
     mysql -u root rx_db < rxdb.sql
     ```

4. **Run Diagnosis.py and Prescription.py:**
   - Execute `Diagnosis.py` and `Prescription.py` using Python:
     ```
     python Diagnosis.py
     python Prescription.py
     ```
     These store python pickle files into directory `/rx-assist/models`

5. **Create a Python Environment:**
   - Create a virtual Python environment using the command:
     ```
     python -m venv env
     ```
     Or
     ```
     python@Version -m venv env
     ```

6. **Activate the Environment:**
   `source env/bin/activate`


7. **Set up the Virtual Environment:**
- Install all the required packages using pip.
  ```
  pip install Django==5.0.3
  pip install scikit-learn==1.3.2
  pip install pandas==2.1.4
  pip install packaging==23.2
  pip install pyparsing==3.1.1
  pip install wheel==0.42.0
  pip install mysqlclient==2.1.1
  pip install Pillow==1.1.0
  ```

8. **Activate Environment and Run Project:**
- Before running the project, always make sure the virtual environment is active.
  ```
  source env/bin/activate
  ```
- Change directory to `rx-assist` and run 
  ```
  python manage.py runserver
  ```

## Pip Packages and Versions

Here's the set of pip packages and versions that were used when testing this project:

| Package         | Version  |
|-----------------|----------|
| asgiref         | 3.7.2    |
| Django          | 5.0.3    |
| joblib          | 1.3.2    |
| mysqlclient     | 2.2.4    |
| numpy           | 1.26.4   |
| packaging       | 23.2     |
| pandas          | 2.1.4    |
| Pillow          | 10.1.0   |
| pip             | 24.0     |
| pyparsing       | 3.1.1    |
| python-dateutil | 2.9.0.post0 |
| pytz            | 2024.1   |
| scikit-learn    | 1.3.2    |
| scipy           | 1.12.0   |
| setuptools      | 69.1.0   |
| six             | 1.16.0   |
| sqlparse        | 0.4.4    |
| threadpoolctl   | 3.3.0    |
| tzdata          | 2024.1   |

Feel free to reach out if you have any questions or encounter any issues.
