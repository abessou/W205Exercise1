#! /bin/bash

echo rename files and trim headers
tail -n +2 ~/data/downloads/exercise1/'Hospital General Information.csv' > ~/data/downloads/exercise1/hospitals.csv
tail -n +2 ~/data/downloads/exercise1/'Timely and Effective Care - Hospital.csv' > ~/data/downloads/exercise1/effective_care.csv
tail -n +2 ~/data/downloads/exercise1/'Readmissions and Deaths - Hospital.csv' > ~/data/downloads/exercise1/readmissions.csv
tail -n +2 ~/data/downloads/exercise1/'hvbp_hcahps_08_06_2015.csv' > ~/data/downloads/exercise1/surveys_responses.csv
tail -n +2 ~/data/downloads/exercise1/'Measure Dates.csv' > ~/data/downloads/exercise1/measure_dates.csv

echo load csv files to hdfs
hadoop fs -put ~/data/downloads/exercise1/hospitals.csv /user/ckekeh/exercise1/hospitals/hospitals.csv
hadoop fs -put ~/data/downloads/exercise1/effective_care.csv /user/ckekeh/exercise1/effective_care/effective_care.csv
hadoop fs -put ~/data/downloads/exercise1/readmissions.csv /user/ckekeh/exercise1/readmissions/readmissions.csv
hadoop fs -put ~/data/downloads/exercise1/measure_dates.csv /user/ckekeh/exercise1/measure_dates/measure_dates.csv
hadoop fs -put ~/data/downloads/exercise1/surveys_responses.csv /user/ckekeh/exercise1/surveys_responses/survey_responses.csv

