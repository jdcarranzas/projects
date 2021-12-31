# Data Dictionary

This project uses 4 complete datasets with information about credits and people for identifying the churn probability of them all.

## Churn_Probability.CSV

This dataset contains the id of the people associated with their respective churn probability. 

| feature | type | description |
| --- | --- | --- |
| Documento del cliente | ID | Unique code that identifies the client, used for merging with the Credits.csv dataset, Payments.csv dataset and Personal_Data.csv dataset |
| Probabilidad de churn | float | Churn probability associated with that particular client |

## Credits.csv

This dataset contains the information from the clients and details of disbursement

| feature | type | description |
| --- | --- | --- |
| Documento del cliente | ID | Unique code that identifies the client, used for merging with the Churn_Probability.csv dataset, Payments.csv dataset and Personal_Data.csv dataset |
| Fecha de desembolso | date | Date of disbursement from the bank to the client |
| Valor del desembolso | int | Exact value of the disbursement from the bank |
| Tasa Efectiva Anual | float | Real interest rate issued by the bank |
| Plazo | int | Amount of months/payments agreed with the client |
| Cuota | float | Monthly payment from the client |

## Personal_Data.csv

This dataset contains the information from the clients

| feature | type | description |
| --- | --- | --- |
| Documento del cliente | ID | Unique code that identifies the client, used for merging with the Churn_Probability.csv dataset, Payments.csv dataset and Credits.csv dataset |
| Sector | str/factor | Occupation of the client |
| Edad | int | Age of the client |
| Género | bool | 0: Female, 1: Male. Indicates the sex of the client |

## Payments.txt

Contains detailed information about the payments made by the clients

| feature | type | description |
| --- | --- | --- |
| Documento del cliente | ID | Unique code that identifies the client, used for merging with the Churn_Probability.csv dataset, Personal_Data.csv dataset and Credits.csv dataset |
| Cuotas ya pagadas | int | Number of payed fees |
| Madurez | float | Age of the credit, if is over 1, it has passed the total initial amount of time |
| Probabilidad de churn | float | Churn Probability for the credit |