import pandas as pd
from pandas import read_csv
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
import joblib as joblib

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

# Keep only one entry for each unique combination of Gender, Age, and Disease
data = data.drop_duplicates(subset=['Gender', 'Age', 'Disease'])
print(data.head())
print("data size",data.shape)
print("Unique disease id",data.Disease.unique())
# Prepare features (x) and target (y)
df_x = data[['Disease', 'Gender', 'Age']]
df_y = data[['Drug']]

# Split the dataset into training and testing sets
x_train, x_test, y_train, y_test = train_test_split(df_x, df_y, test_size=0.2, random_state=0)

# Random Forest
rf = RandomForestClassifier()
rf = rf.fit(df_x, np.ravel(df_y))

# Evaluate Random Forest model
y_pred_rf = rf.predict(x_test)
print("Random Forest Accuracy:", accuracy_score(y_test, y_pred_rf))
print("Random Forest Accuracy (non-normalized):", accuracy_score(y_test, y_pred_rf, normalize=False))
print("Random Forest Score:", rf.score(x_test, y_test))
print("Random Forest Predictions:", y_pred_rf[:10])

# Save Random Forest model
joblib.dump(rf, 'rx-assist/model/medical_rf.pkl')

# Load Random Forest model and make predictions
clf_rf = joblib.load('rx-assist/model/medical_rf.pkl')
prediction_rf = clf_rf.predict(x_test)
print("Random Forest Result from Loaded Model:", prediction_rf[0])

# Naive Bayes
gnb = GaussianNB()
gnb = gnb.fit(df_x, np.ravel(df_y))

# Evaluate Naive Bayes model
y_pred_nb = gnb.predict(x_test)
print("Naive Bayes Accuracy:", accuracy_score(y_test, y_pred_nb))
print("Naive Bayes Accuracy (non-normalized):", accuracy_score(y_test, y_pred_nb, normalize=False))
print("Naive Bayes Score:", gnb.score(x_test, y_test))
result_nb = gnb.predict(x_test)
print("Naive Bayes Predictions:", result_nb[0])

# Save Naive Bayes model
joblib.dump(gnb, 'rx-assist/model/medical_nb.pkl')

# Load Naive Bayes model and make predictions
clf_nb = joblib.load('rx-assist/model/medical_nb.pkl')
result_nb_loaded = clf_nb.predict(x_test)
print("Naive Bayes Result from Loaded Model:", result_nb_loaded[0])

print("Completed")
