import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import LabelEncoder
from sklearn.impute import SimpleImputer
from flask import Flask, request, jsonify
import pandas as pd
from sklearn.linear_model import LogisticRegression

app = Flask(__name__)
model = None  # Initialize the model variable

def m():
    global model  # Declare the model variable as global

    df = pd.read_csv('SBAnational.csv', low_memory=False)


    df.rename(columns={
        'LoanNr_ChkDgt': 'identifier',
        'Name': 'borrower_name',
        'City': 'borrower_city',
        'State': 'borrower_state',
        'Zip': 'borrower_zip',
        'Bank': 'bank_name',
        'BankState': 'bank_state',
        'NAICS': 'naics_code',
        'ApprovalDate': 'approval_date',
        'ApprovalFY': 'approval_fy',
        'Term': 'term_in_months',
        'NoEmp': 'number_of_employees',
        'NewExist': 'new_or_existing_business',
        'CreateJob': 'number_of_jobs_created',
        'RetainedJob': 'number_of_jobs_retained',
        'FranchiseCode': 'franchise_code',
        'UrbanRural': 'urban_or_rural',
        'RevLineCr': 'revolving_line_of_credit',
        'LowDoc': 'low_doc_loan_program',
        'ChgOffDate': 'charge_off_date',
        'DisbursementDate': 'disbursement_date',
        'DisbursementGrossAmount': 'disbursement_gross_amount',
        'MIS_Status': 'loan_status',
        'ChgOffPrinGr': 'charged_off_principal',
        'GrAppvGross': 'gross_amount_approved_by_bank',
        'SBA_Appv': 'sba_guaranteed_amount'
    }, inplace=True)






    invalid_data = df[df['approval_fy'] == '1976A'].index


    df.loc[invalid_data, 'approval_fy'] = '1976'


    df = df[['term_in_months', 'number_of_employees', 'new_or_existing_business', 'naics_code', 'approval_fy', 'revolving_line_of_credit', 'urban_or_rural', 'loan_status']]
    df['naics_code'] = pd.to_numeric(df['naics_code'], errors='coerce')
    df['approval_fy'] = pd.to_numeric(df['approval_fy'], errors='coerce')



    df = pd.get_dummies(df, columns=['revolving_line_of_credit'], drop_first=True)
    df = df.dropna()

    X = df[['term_in_months', 'number_of_employees', 'new_or_existing_business', 'naics_code', 'approval_fy', 'revolving_line_of_credit_N', 'urban_or_rural']]
    y = df['loan_status']


    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25)


    model = LogisticRegression()


    model.fit(X_train, y_train)


    score = model.score(X_test, y_test)
    print('Accuracy:', score)







# new_loan_data = pd.DataFrame({
#     'term_in_months': [5],
#     'number_of_employees': [1],
#     'new_or_existing_business': [0],
#     'naics_code': [1125],
#     'approval_fy': [2023],
#     'revolving_line_of_credit_N': [0],  # Assuming "N" for revolving_line_of_credit
#     'urban_or_rural': [0]
# })#53%

# new_loan_data_high_chgoff = pd.DataFrame({
#     'term_in_months': [60],  
#     'number_of_employees': [5],  
#     'new_or_existing_business': [1],  
#     'naics_code': [123456],  
#     'approval_fy': [2020],  
#     'revolving_line_of_credit_N': [1],  
#     'urban_or_rural': [1]  
# })#80%

# predicted_loan_status = model.predict(new_loan_data)


# print('Predicted loan status:', predicted_loan_status[0])


# predicted_loan_probabilities = model.predict_proba(new_loan_data)


# probability_pif = predicted_loan_probabilities[0][model.classes_ == 'P I F']


# print('Predicted loan status:', predicted_loan_status[0])
# print('Probability (P I F):', probability_pif)

@app.route('/predict', methods=['POST'])
def predict():
    # You can pass query parameters in the GET request
    term_in_months = int(request.args.get('term_in_months', 36))
    number_of_employees = int(request.args.get('number_of_employees', 10))
    new_or_existing_business = int(request.args.get('new_or_existing_business', 1))
    naics_code = int(request.args.get('naics_code', 448310))
    approval_fy = int(request.args.get('approval_fy', 2023))
    revolving_line_of_credit_N = int(request.args.get('revolving_line_of_credit_N', 1))
    urban_or_rural = int(request.args.get('urban_or_rural', 1))

    new_loan_data = pd.DataFrame({
        'term_in_months': [term_in_months],
        'number_of_employees': [number_of_employees],
        'new_or_existing_business': [new_or_existing_business],
        'naics_code': [naics_code],
        'approval_fy': [approval_fy],
        'revolving_line_of_credit_N': [revolving_line_of_credit_N],
        'urban_or_rural': [urban_or_rural]
    })

    # new_loan_data = clean_and_normalize_data(new_loan_data)

    # Predict the loan status and the associated probabilities
    predicted_loan_status = model.predict(new_loan_data)
    predicted_loan_probabilities = model.predict_proba(new_loan_data)

    # Get the probability for "P I F"
    probability_pif = predicted_loan_probabilities[0][model.classes_ == 'P I F'][0]

    # Create a response JSON
    response = {
        'predicted_loan_status': predicted_loan_status[0],
        'probability_pif': probability_pif
    }

    return jsonify(response)

if __name__ == '__main__':
    m()
    app.run(host='0.0.0.0', port=5000)

