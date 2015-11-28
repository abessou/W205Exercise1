add FILE /home/ckekeh/src/W205/W205Exercise1/transforming/transform_readmissions.py;

use exercise1;

CREATE TABLE transformed_readmissions AS
SELECT TRANSFORM
(PROVIDERID, 
MEASUREID,
COMPAREDTONATIONAL,
DENOMINATOR,
SCORE)
USING 'python transform_readmissions.py' AS
(PROVIDERID string, MEASUREID string,
COMPAREDTONATIONAL string, DENOMINATOR int, SCORE float)
FROM readmissions;
