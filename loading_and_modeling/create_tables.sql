ADD JAR /home/ckekeh/data/downloads/serde/csv-serde-1.1.2-0.11.0-all.jar;

CREATE DATABASE IF NOT EXISTS exercise1;

use exercise1;

CREATE EXTERNAL TABLE IF NOT EXISTS hospitals
(PROVIDERID STRING, HOSPITALNAME STRING, ADDRESS STRING, CITY STRING,
STATE STRING, ZIPCODE STRING, COUNTYNAME STRING, PHONENUMBER STRING,
HOSPITALTYPE STRING, HOSPITALOWNERSHIP STRING, EMERGENCYSERVICES STRING)
COMMENT 'HOSPITAL TABLE'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
 )
STORED AS TEXTFILE LOCATION '/user/ckekeh/exercise1/hospitals';


CREATE EXTERNAL TABLE IF NOT EXISTS effective_care
(PROVIDERID STRING, HOSPITALNAME STRING, ADDRESS STRING, CITY STRING, 
STATE STRING, ZIPCODE STRING, COUNTYNAME STRING, PHONENUMBER STRING,
CONDITION STRING, MEASUREID STRING, MEASURENAME STRING, SCORE STRING, 
SAMPLE STRING, FOOTNOTE STRING, MEASURESTARTDATE STRING, MEASUREENDDATE STRING)
COMMENT 'EFFECTIVE CARE TABLE' 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
)
STORED AS TEXTFILE LOCATION '/user/ckekeh/exercise1/effective_care';


CREATE EXTERNAL TABLE IF NOT EXISTS readmissions
(PROVIDERID STRING, HOSPITALNAME STRING, ADDRESS STRING, CITY STRING,
STATE STRING, ZIPCODE STRING, COUNTYNAME STRING, PHONENUMBER STRING,
MEASURENAME STRING, MEASUREID STRING, COMPAREDTONATIONAL STRING, 
DENOMINATOR STRING, SCORE STRING, LOWERESTIMATE STRING, HIGHERESTIMATE STRING,
FOOTNOTE STRING, MEASURESTARTDATE STRING, MEASUREENDDATE STRING)
COMMENT 'READMISSIONS TABLE'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
 )
STORED AS TEXTFILE LOCATION '/user/ckekeh/exercise1/readmissions';


CREATE EXTERNAL TABLE IF NOT EXISTS surveys_responses
(PROVIDERID STRING, HOSPITALNAME STRING, ADDRESS STRING, CITY STRING,
STATE STRING, ZIPCODE STRING, COUNTYNAME STRING, 
COMM_WITH_NURSES_ACHIEV STRING, COMM_WITH_NURSES_IMPROV STRING,
COMM_WITH_NURSES_DIM STRING,
COMM_WITH_DOCTORS_ACHIEV STRING, COMM_WITH_DOCTORS_IMPROV STRING,
COMM_WITH_DOCTORS_DIM STRING, 
RESPONS_HOSP_STAFF_ACHIEV STRING, RESPONS_HOSP_STAFF_IMPROV STRING, 
RESPONS_HOSP_STAFF_DIM STRING,
PAIN_MANAG_ACHIEV STRING, PAIN_MANAG_IMPROV STRING, PAIN_MANAG_DIM STRING,
COMM_MEDICINES_ACHIEV STRING, COMM_MEDICINES_IMPROV STRING,
COMM_MEDICINES_DIM STRING,
CLEAN_AND_QUIET_ACHIEV STRING, CLEAN_AND_QUIET_IMPROV STRING,
CLEAN_AND_QUIET_DIM STRING,
DISCHARGE_INFO_ACHIEVE STRING, DISCHARGE_INFO_IMPROV STRING,
DISCHARGE_INFO_DIM STRING,
OVERALL_RATING_ACHIEV STRING, OVERALL_RATING_IMPROV STRING,
OVERALL_RATING_DIM STRING,
HCAHPS_BASE_SCORE STRING, HCAHPS_CONSISTENCY_SCORE STRING)
COMMENT 'SURVEYS RESULTS TABLE' 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
 )
STORED AS TEXTFILE LOCATION '/user/ckekeh/exercise1/surveys_responses';

CREATE EXTERNAL TABLE IF NOT EXISTS measure_dates
(MEASURENAME STRING, MEASUREID STRING, MEASURESTARTQUARTER STRING, 
MEASURESTARTDATE STRING, MEASUREENDQUARTER STRING, MEASUREENDDATE STRING)
COMMENT 'MEASURE DATES TABLE' 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
 )
STORED AS TEXTFILE LOCATION '/user/ckekeh/exercise1/measure_dates';
