Project Setup Guide

This guide provides instructions on how to set up and run the project locally. Follow these steps to get started with the project.

Prerequisites

- Python 3.11.6
- virtualenv 20.25.0
- MySQL

Setup Instructions

1. Install Python:
   - Ensure Python 3.11.6 is installed on your system. If not, download and install Python from python.org.

2. Install virtualenv:
   - Run: `pip install virtualenv==20.25.0`

3. Install MySQL and Configure it:
   - Install MySQL on your system following the instructions provided by MySQL's official documentation.
   - Update database information in rx-assist/rx-assist/settings.py if necessary.
   - By default, this project connects to MySQL as the root user without requiring a password.

4. Create Database and Import Tables:
   - Create a new database in MySQL.
     `mysql create database rx_db`
   - Import tables using rxdb.sql:
     `mysql -u root rx_db < rxdb.sql`

5. Run Diagnosis.py and Prescription.py:
   - Execute Diagnosis.py and Prescription.py using Python:
     ```
     python Diagnosis.py
     python Prescription.py
     ```

6. Setup Django Environment:
   - Run the setup script to download and set up Django variables in a virtual environment:
    `sh setup`
     

7. Activate Environment and Run Project:
   - Activate the virtual environment:
     `source env/bin/activate`
   - Change directory to rx-assist and run 
     `python manage.py runserver`

Summary 
Steps to run this project. 
1. Install python, (Recommended version: 3.11.6 )
2. Install virtualenv in system (The project was tested on virtualenv 20.25.0)
3. Install mysql and configure it. if you use mysql with a password, you'll have to update database information on this file "/rx-assist/rx-assist/settings.py", line 80 to 89. By default this project will work with my sql without a password as root user.
4. In mysql, make a new database. Import all tables required by importing the rxdb.sql file into mysql.
mysql -u root < rxdb.sql
5. Run Diagnosis.py and Prescription.py using python.
6. Now you can run the setup script. This will download and set up all the django variables in an env.
7. Use the command "source env/bin/activate" to activate environment and run this project.


