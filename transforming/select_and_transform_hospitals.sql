add FILE /home/ckekeh/src/W205/W205Exercise1/transforming/transform_hospitals.py;

use exercise1;

CREATE TABLE transformed_hospitals AS 
SELECT TRANSFORM
(PROVIDERID, HOSPITALNAME, ADDRESS, CITY, STATE, ZIPCODE, COUNTYNAME, 
PHONENUMBER, HOSPITALTYPE, HOSPITALOWNERSHIP)
USING 'python transform_hospitals.py' AS
(ProviderId string, Name string, Address string, City string, State string, 
Zip string, County string, Phone string, Type string, Ownership string)
FROM hospitals;
