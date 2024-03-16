import pandas as pd
from pandas import read_csv
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
import joblib as joblib
from sklearn import tree
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

# Load and preprocess the dataset
filename = 'Datasets/DrugRecommendation/Drug.csv'
data = read_csv(filename)

# Check for missing values
print("Missing values in the dataset:\n", data.isnull().sum())

# Replace Gender values with numeric encoding
data.replace({'Gender': {'Female': 0, 'Male': 1}}, inplace=True)

disease_mapping = {
        'Acne': 0, 'Allergy': 1, 'Diabetes': 2, 'Fungal infection': 3,
        'Urinary tract infection': 4, 'Malaria': 5, 'Migraine': 6, 'Hepatitis B': 7,
        'AIDS': 8, 'GERD': 9, 'Chronic cholestasis': 10, 'Drug Reaction': 11,
        'Gastroenteritis': 12, 'Bronchial Asthma': 13, 'Hypertension': 14,
        'Cervical Spondylosis': 15, 'Paralysis (brain hemorrhage)': 16,
        'Jaundice': 17, 'Chicken Pox': 18, 'Dengue': 19, 'Typhoid': 20,
        'Hepatitis A': 21, 'Hepatitis C': 22, 'Hepatitis D': 23, 'Hepatitis E': 24,
        'Alcoholic Hepatitis': 25, 'Tuberculosis': 26, 'Common Cold': 27,
        'Pneumonia': 28, 'Heart Attack': 29, 'Varicose Veins': 30,
        'Hypothyroidism': 31, 'Hyperthyroidism': 32, 'Hypoglycemia': 33,
        'Osteoarthritis': 34, 'Arthritis': 35, '(vertigo) Paroxysmal Positional Vertigo': 36,
        'Psoriasis': 37, 'Impetigo': 38, 'Dimorphic Hemorrhoids (Piles)': 39,
        'Peptic Ulcer Disease': 40
    }

# Replace Disease values with numeric encoding
data.replace({'Disease': disease_mapping}, inplace=True)


print(data.head())
print("Unique disease id",data.Disease.unique())
# Prepare features (x) and target (y)
df_x = data[['Disease', 'Gender', 'Age']]
df_y = data[['Drug']]

# Split the dataset into training and testing sets
x_train, x_test, y_train, y_test = train_test_split(df_x, df_y, test_size=0.2, random_state=0)

# Decision Tree
clf_dt = tree.DecisionTreeClassifier()
clf_dt = clf_dt.fit(df_x, df_y)
y_pred_dt = clf_dt.predict(x_test)
print("Decision Tree Accuracy:", accuracy_score(y_test, y_pred_dt))
#print("Decision Tree Classification Report:\n", classification_report(y_test, y_pred_dt))