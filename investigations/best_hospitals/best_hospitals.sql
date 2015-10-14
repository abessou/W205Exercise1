SELECT rs1.providerid, rs1.name, rs1.city, rs1.state, 
COUNT(*) AS top_measures_count FROM
(SELECT rs.name, rs.city, rs.state, rs.providerid FROM
(SELECT transformed_hospitals.name, transformed_hospitals.providerid,
transformed_hospitals.city, transformed_hospitals.state,
transformed_measures.measurename, Rank() OVER
(PARTITION BY transformed_effective_care.measureid
ORDER BY transformed_effective_care.score DESC) AS rank
FROM transformed_hospitals, transformed_effective_care, transformed_measures
WHERE transformed_hospitals.providerid = transformed_effective_care.providerid
AND transformed_effective_care.measureid = transformed_measures.measureid) rs
WHERE rs.rank <= 1) rs1 GROUP BY rs1.providerid, rs1.name, rs1.city,
rs1.state ORDER BY top_measures_count DESC LIMIT 10;
