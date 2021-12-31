# Data Dictionary

This project uses 4 complete datasets with information about credits and people for identifying the churn probability of them all.

## Churn_Probability.CSV

This dataset contains the id of the people associated with their respective churn probability. 

| feature | type | description |
| --- | --- | --- |
| Documento del cliente | ID | Unique code that identifies the client, used for merging with the Credits.csv dataset, Payments.csv dataset and Personal_Data.csv dataset |
| Probabilidad de churn | float | Churn probability associated with that particular client |

## artist_corpus.csv

El dataset es un corpus completo con todas las canciones de cada uno de los artistas, donde cada registro es un artista único con el corpus completo de su repertorio musical. 

| columna | tipo | descripción |
| --- | --- | --- |
| artist | STR | Nombre del artista |
| lyrics  | STR | Todas las canciones del artista unidas en un solo corpus |

## songs_df.csv

El dataset es similar, salvo que cada registro es una canción única del artista y permite el análisis preliminar del script de EDA. 

| columna | tipo | descripción |
| --- | --- | --- |
| artist | STR | Nombre del artista |
| lyrics  | STR | Todas las canciones del artista, separadas en registros únicos por canción |

## corpus.txt

Es un archivo de texto sin estructura de dataset que contiene todas las canciones de todos los artistas, usado para el entrenamiento y ajuste del modelo de redes neuronales LSTM para la generación de lyrics.
