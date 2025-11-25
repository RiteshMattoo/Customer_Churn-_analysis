#CLEANING ANALYSIS

UPDATE customers
SET 
    customerID = TRIM(customerID),
    gender = TRIM(gender),
    Partner = TRIM(Partner),
    Dependents = TRIM(Dependents),
    PhoneService = TRIM(PhoneService),
    MultipleLines = TRIM(MultipleLines),
    InternetService = TRIM(InternetService),
    OnlineSecurity = TRIM(OnlineSecurity),
    OnlineBackup = TRIM(OnlineBackup),
    DeviceProtection = TRIM(DeviceProtection),
    TechSupport = TRIM(TechSupport),
    StreamingTV = TRIM(StreamingTV),
    StreamingMovies = TRIM(StreamingMovies),
    Contract = TRIM(Contract),
    PaperlessBilling = TRIM(PaperlessBilling),
    PaymentMethod = TRIM(PaymentMethod);
    
#Convert empty TotalCharges → NULL

UPDATE customers
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

#Replace non-numeric TotalCharges with NULL
UPDATE customers
SET TotalCharges = NULL
WHERE TotalCharges REGEXP '[^0-9\.]';

#Convert TotalCharges datatype to DECIMAL
ALTER TABLE customers
MODIFY COLUMN TotalCharges DECIMAL(10,2);
