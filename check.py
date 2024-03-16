import pandas as pd



# Specify the file paths for training and testing data
file1 = 'Datasets/DrugRecommendation/Drug.csv'
file2='Datasets/DiseasePrediction/Training.csv'

disease_data = pd.read_csv(file2)
drug_data = pd.read_csv(file1)
unique_diseases_train = disease_data['prognosis'].unique()
Drug_disease = drug_data['Disease'].unique()

print("Number of items: ",len(unique_diseases_train))
print("No fo items in drugs",len(Drug_disease))
count=0

disease_list = [
    'Acne', 'Allergy', 'Diabetes', 'Fungal infection', 'Urinary tract infection',
    'Malaria', 'Migraine', 'Hepatitis B', 'AIDS', 'GERD', 'Chronic cholestasis',
    'Drug Reaction', 'Gastroenteritis', 'Bronchial Asthma', 'Hypertension',
    'Cervical Spondylosis', 'Paralysis (brain hemorrhage)', 'Jaundice', 'Chicken Pox',
    'Dengue', 'Typhoid', 'Hepatitis A', 'Hepatitis C', 'Hepatitis D', 'Hepatitis E',
    'Alcoholic Hepatitis', 'Tuberculosis', 'Common Cold', 'Pneumonia', 'Heart Attack',
    'Varicose Veins', 'Hypothyroidism', 'Hyperthyroidism', 'Hypoglycemia',
    'Osteoarthritis', 'Arthritis', '(vertigo) Paroxysmal Positional Vertigo',
    'Psoriasis', 'Impetigo', 'Dimorphic Hemorrhoids (Piles)', 'Peptic Ulcer Disease'
    ]
new_unique_diseases_train=[]
new_Drug_disease=[]
new_diseases=[]
for disease in unique_diseases_train:
    if disease not in Drug_disease:
        new_unique_diseases_train.append(disease)

for drugD in Drug_disease:
    if drugD not in unique_diseases_train:
        new_Drug_disease.append(drugD)

for drugD in disease_list:
    if drugD not in unique_diseases_train:
        new_diseases(drugD)

print(new_Drug_disease)
print(new_unique_diseases_train)
print(new_diseases)