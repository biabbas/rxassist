import pandas as pd

def print_unique_diseases(file_name,SearchItem):
    #Read data
    train_data = pd.read_csv(file_name)
    unique_diseases_train = train_data[SearchItem].unique()

    # Print unique disease names
    print("Unique ",SearchItem,"s in Training Data: ")
    print("Number of items: ",len(unique_diseases_train))
    for disease in unique_diseases_train:
        print("- ", disease)
    print("Number of items: ",len(unique_diseases_train))




# Specify the file paths for training and testing data
training_file_path = 'Datasets/DrugRecommendation/Drug.csv'

# Call the function
print_unique_diseases(training_file_path,"Disease")

