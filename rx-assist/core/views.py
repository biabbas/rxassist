import numpy as np
from django.http import JsonResponse
from django.shortcuts import render, redirect
from .models import User, Profile
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib import auth
from django.db import connection
from datetime import datetime

import os
from django.contrib import messages
import joblib as joblib
from django.contrib.auth.hashers import make_password


def about(request):
    return render(request, 'about.html')



def doctor_list(request):
    c = connection.cursor()
    c.execute("SELECT CONCAT(first_name, ' ', last_name) AS name, DATE(date_joined) AS joined_date, phonenumber FROM core_user WHERE is_doctor = 1 AND is_active = 1")
    doctors = c.fetchall()
    columns = ["Name", "Joined On", "Contact Number"]
    context = {
        'columns': columns,
        'doctors': doctors,
    }
    return render(request, 'doctors.html', context)

def home(request):
    return render(request, 'home.html')


def registerView(request):
    return render(request, 'register.html')





def registerUser(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']

        birth_date = request.POST['birth_date']
        region = request.POST['region']
        country = request.POST['country']
        gender = request.POST['gender']

        # Check if the username already exists
        if User.objects.filter(username=username).exists():
            messages.error(request, f'Username \'{username}\' already exists. Please choose a different username.')
            return redirect('reg')

        
        user = User.objects.create(
            username=username,
            email=email,
            password=make_password(password),
            is_patient=True
        )

        
        Profile.objects.create(
            user=user,
            birth_date=birth_date,
            gender=gender,
            country=country,
            region=region
        )
        print(" Users name and gender ", user, gender)

        messages.success(request, f'Account Created Successfully. You can login using the username \'{username}\'')
        return redirect('login')
    else:
        messages.error(request, 'Failed to Register')
        return redirect('reg')



def loginView(request):
    user = request.user
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None and user.is_active:
            auth.login(request, user)
        else:
            messages.info(request, 'Invalid username or password')
            return redirect('login')
    if user.is_authenticated:
        if user.is_patient:
            return redirect('patient')
        elif user.is_doctor:
            return redirect('doctor')
        else:
            messages.info(request, 'Invalid User type')
            return redirect('login')
    else:
        return render(request, 'login.html')

@login_required
def patient_home(request):
    doctor = User.objects.filter(is_doctor=True).count()
    patient = User.objects.filter(is_patient=True).count()
    c = connection.cursor()
    c.execute("SELECT COUNT(*) from appointments where approved = 1")
    row = c.fetchone()
    appointment = row[0] if row else -1
    c.execute("SELECT COUNT(*) from patient_diagnosis where medicine != 'Make Appointment' ")
    row = c.fetchone()
    drugs = row[0] if row else -1
    context = { 'doctor': doctor,
                   'appointment': appointment, 'patient': patient, 'drug': drugs}
    return render(request, 'patient/home.html', context)



@login_required
def diagnosis(request):
    symptoms = ['itching', 'skin_rash', 'nodal_skin_eruptions', 'continuous_sneezing', 'shivering', 'chills', 'joint_pain', 'stomach_pain', 'acidity', 'ulcers_on_tongue', 'muscle_wasting', 'vomiting', 'burning_micturition', 'spotting_ urination', 'fatigue', 'weight_gain', 'anxiety', 'cold_hands_and_feets', 'mood_swings', 'weight_loss', 'restlessness', 'lethargy', 'patches_in_throat', 'irregular_sugar_level', 'cough', 'high_fever', 'sunken_eyes', 'breathlessness', 'sweating', 'dehydration', 'indigestion', 'headache', 'yellowish_skin', 'dark_urine', 'nausea', 'loss_of_appetite', 'pain_behind_the_eyes', 'back_pain', 'constipation', 'abdominal_pain', 'diarrhoea', 'mild_fever', 'yellow_urine', 'yellowing_of_eyes', 'acute_liver_failure', 'fluid_overload', 'swelling_of_stomach', 'swelled_lymph_nodes', 'malaise', 'blurred_and_distorted_vision', 'phlegm', 'throat_irritation', 'redness_of_eyes', 'sinus_pressure', 'runny_nose', 'congestion', 'chest_pain', 'weakness_in_limbs', 'fast_heart_rate', 'pain_during_bowel_movements', 'pain_in_anal_region', 'bloody_stool', 'irritation_in_anus', 'neck_pain', 'dizziness', 'cramps', 'bruising', 'obesity', 'swollen_legs', 'swollen_blood_vessels', 'puffy_face_and_eyes', 'enlarged_thyroid',
                'brittle_nails', 'swollen_extremeties', 'excessive_hunger', 'extra_marital_contacts', 'drying_and_tingling_lips', 'slurred_speech', 'knee_pain', 'hip_joint_pain', 'muscle_weakness', 'stiff_neck', 'swelling_joints', 'movement_stiffness', 'spinning_movements', 'loss_of_balance', 'unsteadiness', 'weakness_of_one_body_side', 'loss_of_smell', 'bladder_discomfort', 'foul_smell_of urine', 'continuous_feel_of_urine', 'passage_of_gases', 'internal_itching', 'toxic_look_(typhos)', 'depression', 'irritability', 'muscle_pain', 'altered_sensorium', 'red_spots_over_body', 'belly_pain', 'abnormal_menstruation', 'dischromic _patches', 'watering_from_eyes', 'increased_appetite', 'polyuria', 'family_history', 'mucoid_sputum', 'rusty_sputum', 'lack_of_concentration', 'visual_disturbances', 'receiving_blood_transfusion', 'receiving_unsterile_injections', 'coma', 'stomach_bleeding', 'distention_of_abdomen', 'history_of_alcohol_consumption', 'fluid_overload', 'blood_in_sputum', 'prominent_veins_on_calf', 'palpitations', 'painful_walking', 'pus_filled_pimples', 'blackheads', 'scurring', 'skin_peeling', 'silver_like_dusting', 'small_dents_in_nails', 'inflammatory_nails', 'blister', 'red_sore_around_nose', 'yellow_crust_ooze']
    symptoms = sorted(symptoms)
    context = {'symptoms': symptoms}
    return render(request, 'patient/diagnosis.html', context)


@csrf_exempt
def MakePredict(request):
    id = request.POST.get('id')
    symptoms = request.POST.get('symptoms')
    list_b = list(set(symptoms.split(',')))
    list_a = ['itching', 'skin_rash', 'nodal_skin_eruptions', 'continuous_sneezing', 'shivering', 'chills', 'joint_pain', 'stomach_pain', 'acidity', 'ulcers_on_tongue', 'muscle_wasting', 'vomiting', 'burning_micturition', 'spotting_ urination', 'fatigue', 'weight_gain', 'anxiety', 'cold_hands_and_feets', 'mood_swings', 'weight_loss', 'restlessness', 'lethargy', 'patches_in_throat', 'irregular_sugar_level', 'cough', 'high_fever', 'sunken_eyes', 'breathlessness', 'sweating', 'dehydration', 'indigestion', 'headache', 'yellowish_skin', 'dark_urine', 'nausea', 'loss_of_appetite', 'pain_behind_the_eyes', 'back_pain', 'constipation', 'abdominal_pain', 'diarrhoea', 'mild_fever', 'yellow_urine', 'yellowing_of_eyes', 'acute_liver_failure', 'fluid_overload', 'swelling_of_stomach', 'swelled_lymph_nodes', 'malaise', 'blurred_and_distorted_vision', 'phlegm', 'throat_irritation', 'redness_of_eyes', 'sinus_pressure', 'runny_nose', 'congestion', 'chest_pain', 'weakness_in_limbs', 'fast_heart_rate', 'pain_during_bowel_movements', 'pain_in_anal_region', 'bloody_stool', 'irritation_in_anus', 'neck_pain', 'dizziness', 'cramps', 'bruising', 'obesity', 'swollen_legs', 'swollen_blood_vessels', 'puffy_face_and_eyes', 'enlarged_thyroid',
              'brittle_nails', 'swollen_extremeties', 'excessive_hunger', 'extra_marital_contacts', 'drying_and_tingling_lips', 'slurred_speech', 'knee_pain', 'hip_joint_pain', 'muscle_weakness', 'stiff_neck', 'swelling_joints', 'movement_stiffness', 'spinning_movements', 'loss_of_balance', 'unsteadiness', 'weakness_of_one_body_side', 'loss_of_smell', 'bladder_discomfort', 'foul_smell_of urine', 'continuous_feel_of_urine', 'passage_of_gases', 'internal_itching', 'toxic_look_(typhos)', 'depression', 'irritability', 'muscle_pain', 'altered_sensorium', 'red_spots_over_body', 'belly_pain', 'abnormal_menstruation', 'dischromic _patches', 'watering_from_eyes', 'increased_appetite', 'polyuria', 'family_history', 'mucoid_sputum', 'rusty_sputum', 'lack_of_concentration', 'visual_disturbances', 'receiving_blood_transfusion', 'receiving_unsterile_injections', 'coma', 'stomach_bleeding', 'distention_of_abdomen', 'history_of_alcohol_consumption', 'fluid_overload', 'blood_in_sputum', 'prominent_veins_on_calf', 'palpitations', 'painful_walking', 'pus_filled_pimples', 'blackheads', 'scurring', 'skin_peeling', 'silver_like_dusting', 'small_dents_in_nails', 'inflammatory_nails', 'blister', 'red_sore_around_nose', 'yellow_crust_ooze']
    list_c = []
    for x in range(0, len(list_a)):
        list_c.append(0)
    Symptoms=0
    i = 0
    while i < len(list_b):
        inputSymptoms = list_b[i]
        if inputSymptoms in list_a:
            index = list_a.index(inputSymptoms)
            list_c[index] = 1
            Symptoms += 1
            i += 1
        else:
            del list_b[i]
    print("No of Symptoms: ",Symptoms)
    print(list_b)
    if Symptoms == 0:
        return JsonResponse({'status': 'error'})
    test = list_c
    test = np.array(test)
    test = np.array(test).reshape(1, -1)
    modelDT = joblib.load('model/decision_tree.pkl')
    modelNB = joblib.load('model/naive_bayes.pkl')
    modelLP = joblib.load('model/lopistic_regression.pkl')
    modelRF = joblib.load('model/random_forest.pkl')
    DTpred = modelDT.predict(test)
    NBpred = modelNB.predict(test)
    LPpred = modelLP.predict(test)
    RFpred = modelRF.predict(test)
    predictions = [DTpred[0], NBpred[0], LPpred[0], RFpred[0]]
    print("Predictions: ", predictions)
    from collections import Counter

    # Count the occurrences of each prediction
    prediction_counts = Counter(predictions)


    max_count = max(prediction_counts.values())
    result_candidates = [prediction for prediction, count in prediction_counts.items() if count == max_count]
    # Check conditions for undetermined result
    if len(result_candidates) == 1:
        result = result_candidates[0]
        message = result_candidates
    else:
        message = f"Undetermined. Symptoms match multiple possible conditions: {result_candidates}. Further evaluation and diagnostic tests are required for a precise diagnosis."
        result = f"4: {result_candidates}"
    c = connection.cursor()
    c.execute("INSERT INTO patient_diagnosis (disease, patient_id, medicine, created_on, num_symptoms) VALUES (%s, %s, '', %s, %s)", (result, id, datetime.now(), Symptoms))
    diagnosis_id = c.lastrowid
    print("diagnosis Id",diagnosis_id)
    for symptom in list_b:
        c.execute("INSERT INTO diagnosis_symptoms (patient_diagnosis_id, symptom) VALUES (%s, %s)", (diagnosis_id, symptom))
    return JsonResponse({'status': message})

@login_required
def patient_result(request):
    user_id = request.user.id  
    try:
        c = connection.cursor()
        c.execute("SELECT pd.id, cu.username, pd.disease, pd.medicine FROM patient_diagnosis pd Left outer JOIN core_user cu ON pd.doctor_id = cu.id WHERE patient_id = %s", [user_id])
        diseases = c.fetchall()     
        print("diseaseon",diseases)
        context = {'diseases': diseases}
        return render(request, 'patient/result.html', context)
    except Exception as e:
        print(e)


@login_required
@csrf_exempt
def MakeMent(request):
    disease = request.POST.get('disease')
    userid = request.POST.get('userid')
    try:
        c = connection.cursor()
        c.execute("SELECT * FROM appointments WHERE medical_id = %s", [disease]) 
        res = c.fetchone()
        if res:
            print('Appointment Exist')
            return JsonResponse({'status': 'exist'})
        else:
            c.execute("INSERT INTO appointments (medical_id, patient_id) VALUES (%s, %s)", [disease, userid])
            return JsonResponse({'status': 'saved'})
    except Exception as e:
        return JsonResponse({'status': 'error'})


@login_required
def patient_ment(request):
    user_id = request.user.id
    c = connection.cursor()
    c.execute("SELECT * FROM appointments WHERE patient_id=%s", [user_id])
    appointment = c.fetchall()
    context = {'appointment': appointment}
    return render(request, 'patient/appointment.html', context)

@login_required
def logoutView(request):
    logout(request)
    return redirect('login')


@login_required
def doctor_home(request):
    user = request.user
    if user.is_patient:
        return redirect('patient')
    c = connection.cursor()
    c.execute(f"SELECT COUNT(DATE(ment_day)) AS count_ment FROM appointments WHERE DATE(ment_day) > CURDATE(); ")
    row = c.fetchone()
    nextappointments_count = row[0] if row else -1
    c.execute("SELECT COUNT(*) from appointments where approved = 1")
    row = c.fetchone()
    appointments_count = row[0] if row else -1
    mypatients_count = User.objects.filter(is_patient=True).count()
    c.execute("Select count(*) from patient_diagnosis where medicine=''")
    row = c.fetchone()
    patients_count =  row[0] if row else -1

    context = {
        'mypatients': mypatients_count,
        'appointments': appointments_count,
        'nextappointments': nextappointments_count,
        'patients': patients_count,
    }

    return render(request, 'doctor/home.html', context)

@login_required
def doctor_commend(request):
    user = request.user
    if user.is_patient:
        return redirect('patient') 
    user_id = request.user.id 
    try:
        c = connection.cursor()
        c.execute("SELECT * FROM patient_diagnosis")
        diseases = c.fetchall()   
        context = {'diseases': diseases}
        return render(request, 'doctor/result.html', context)
    except Exception as e:
        print(e)

@login_required
@csrf_exempt
def MakeMend(request):
    disease = request.POST.get('disease')
    userid = request.POST.get('userid')

    print('Disease ID', disease)
    print('User ID is', userid)
    c = connection.cursor()
    c.execute("SELECT patient_id FROM patient_diagnosis WHERE id = %s", [disease_pk])

    row=c.fetchone()
    if row:
        patient_id = row[0]
    else:
        print("Error fetching patient id, Make drug recommend")
        exit(0)
    disease_id = disease

    dob = Profile.objects.filter(
        user_id=patient_id).values_list('birth_date', flat=True)
    dob = list(dob)
    dob = dob[0]
    print('Date of birth is', dob)
    dob = str(dob)
    dob = dob[0:4]
    print('New Date of birth is', dob)
    dob = int(dob)
    age = 2021 - dob
    print('Patient Age is', age)

    gender = Profile.objects.filter(
        user_id=patient_id).values_list('gender', flat=True)
    gender = list(gender)
    gender = gender[0]
    print('Patient Gender is', gender)

    if gender == 'Male':
        sex = 1
    else:
        sex = 0

    print('Patient Sex is', sex)

    c.execute("SELECT disease FROM patient_diagnosis WHERE id = %s", [disease])
    row = c.fetchone()
    if row:
        sick = str(row[0])
    else:
        print("Error fetching patient disease( from drug recommend)")
        exit(0)

    print(f'Patient Disease Diagnosed is1\'{sick}\'')

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

    disease_dict = {
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

    if sick in disease_list:
        print('AI Got Drug For This Disease')
        print(disease_dict.get(sick))
        new_sick = disease_dict.get(sick)

        test = [new_sick, sex, age]
        print(test)
        test = np.array(test)
        print(test.shape)
        test = np.array(test).reshape(1, -1)
        print(test.shape)

        C_Rf = joblib.load('model/medical_rf.pkl')
        RFpred = C_Rf.predict(test)
        c.execute("SELECT medicine FROM patient_diagnosis WHERE id = %s", [disease])
        row = c.fetchone()
        existing_medicine = str(row[0]) if row else "Error"    
        print("Existing medicine,",existing_medicine)
        Pred = RFpred[0]
        if existing_medicine == Pred:
            C_NB = joblib.load('model/medical_nb.pkl')
            NBpred = C_NB.predict(test)
            Pred = NBpred[0]
            Model = 'Naive bayes'
        else:
            Model = 'Random Forest'

        
        print('Predicted Drug Is', Pred)

        try:
            c.execute("UPDATE patient_diagnosis SET medicine = %s WHERE id = %s", [Pred, disease])
            return JsonResponse({'status': f'Drug {Pred} (Using {Model})'})
        except Exception as e:
            print(e)
    else:
        print('AI Can Not Recommend Drug')
        c.execute("UPDATE patient_diagnosis SET medicine = 'Make Appointment' WHERE id = %s",[disease])
        return JsonResponse({'status': 'error'})


@login_required
def doctor_ment(request):
    user = request.user
    if user.is_patient:
        return redirect('patient')   
    user_id = request.user.id   
    try:
        c = connection.cursor()
        c.execute("SELECT * FROM appointments")
        appointment = c.fetchall()
        context = {'appointment': appointment}
        return render(request, 'doctor/appointment.html', context)
    except Exception as e:
        print(e)
        return JsonResponse({'status': 'error'})


@login_required
@csrf_exempt
def SaveMent(request):
    pk = request.POST.get('pk')
    day = request.POST.get('day')
    time = request.POST.get('time')
    c = connection.cursor()
    c.execute("SELECT * FROM appointments WHERE id=%s", [pk])
    row = c.fetchone()
    
    try:
        if row:  # Check if the appointment exists
            user_id = request.user.id
            c.execute("UPDATE appointments SET approved=TRUE, ment_day=%s, time=%s, doctor_id=%s WHERE id=%s",
                      [day, time, user_id, pk])
            return JsonResponse({'status': 'Appointment Set'})
        else:
            print('Appointment Not Exist')
            return JsonResponse({'status': 'not exist'})
    except Exception as e:
        print(e)
        return JsonResponse({'status': 'error'})
