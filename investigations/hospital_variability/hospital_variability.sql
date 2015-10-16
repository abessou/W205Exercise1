use exercise1;

SELECT rs.measurename, rs.measureid, (rs.max-rs.min) AS difference FROM
(SELECT transformed_measures.measurename, transformed_effective_care.measureid,
max(transformed_effective_care.score) as max,
min(transformed_effective_care.score) as min
FROM transformed_hospitals, transformed_effective_care, transformed_measures
WHERE transformed_hospitals.providerid = transformed_effective_care.providerid
AND transformed_effective_care.measureid = transformed_measures.measureid 
GROUP BY transformed_effective_care.measureid, 
transformed_measures.measurename) rs ORDER BY difference DESC LIMIT 20;

