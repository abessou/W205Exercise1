#!/usr/bin/python
import sys
import string
import re

def transform_score(score):
    mapping_regex = "(?P<score>[0-9]+) out of (?P<range>[0-9]+)"
    m = re.match(mapping_regex, score)
    if m == None:
        if score.lower() == "not available":
            return -1
        return -7
    score = int(m.group(1))
    range = int(m.group(2))
    return score/range
    
for line in sys.stdin:
    line = line.strip("\n ")

    ProviderId, \
    COMM_WITH_NURSES_ACHIEV,\
    COMM_WITH_DOCTORS_ACHIEV, \
    RESPONS_HOSP_STAFF_ACHIEV,\
    PAIN_MANAG_ACHIEV, \
    COMM_MEDECINES_ACHIEV, \
    CLEAN_AND_QUIET_ACHIEV, \
    DISCHARGE_INFO_ACHIEV, \
    OVERALL_RATING_ACHIEV, \
    HCAHPS_BASE_SCORE, HCAHPS_CONSISTENCY_SCORE = line.split("\t")

    new_record = "\t".join([ProviderId, \
                            str(transform_score(COMM_WITH_NURSES_ACHIEV)), \
                            str(transform_score(COMM_WITH_DOCTORS_ACHIEV)), \
                            str(transform_score(RESPONS_HOSP_STAFF_ACHIEV)), \
                            str(transform_score(PAIN_MANAG_ACHIEV)), \
                            str(transform_score(COMM_MEDECINES_ACHIEV)), \
                            str(transform_score(CLEAN_AND_QUIET_ACHIEV)), \
                            str(transform_score(DISCHARGE_INFO_ACHIEV)),
                            str(transform_score(OVERALL_RATING_ACHIEV)), \
                            HCAHPS_BASE_SCORE \
			    if HCAHPS_BASE_SCORE!="Not Available" \
			    else "-1", \
			    HCAHPS_CONSISTENCY_SCORE \
			    if HCAHPS_CONSISTENCY_SCORE!="Not Available" \
			    else "-1"])

    print new_record

