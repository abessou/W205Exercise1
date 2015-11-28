add FILE /home/ckekeh/src/W205/W205Exercise1/transforming/transform_effective_care.py;

use exercise1;

CREATE TABLE transformed_effective_care AS
SELECT TRANSFORM
(PROVIDERID,
CONDITION,
MEASUREID,
SCORE,
SAMPLE)
USING 'python transform_effective_care.py' AS
(PROVIDERID string, CONDITION string,
MEASUREID string, SCORE int, SAMPLE int)
FROM effective_care;
