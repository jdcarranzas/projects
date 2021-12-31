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

## songs_df.csv

El dataset es similar, salvo que cada registro es una canción única del artista y permite el análisis preliminar del script de EDA. 

| columna | tipo | descripción |
| --- | --- | --- |
| artist | STR | Nombre del artista |
| lyrics  | STR | Todas las canciones del artista, separadas en registros únicos por canción |

## corpus.txt

Es un archivo de texto sin estructura de dataset que contiene todas las canciones de todos los artistas, usado para el entrenamiento y ajuste del modelo de redes neuronales LSTM para la generación de lyrics.
