#!/usr/bin/python
import sys
import string

def transform_score(score):
    mapping = {"High (40,000 - 59,999 patients annually)":"40000", \
               "Low (0 - 19,999 patients annually)":"0", \
               "Medium (20,000 - 39,999 patients annually)":"20000", \
               "Very High (60,000+ patients annually)":"60000", \
               "Not Available":"-1"}
    if score in mapping:
        return mapping[score]
    else:
        return score

def transform_sample(sample):
    mapping = {"Not Available":"-1", "":"-1"}
    if sample in mapping:
        return mapping[sample]
    else:
        return sample
    

for line in sys.stdin:
    line = line.strip("\n ")

    ProviderId, \
    Condition, \
    MeasureId, \
    Score, \
    Sample = line.split("\t")

    new_record = "\t".join([ProviderId, \
                           Condition, \
                           MeasureId, \
                           transform_score(Score), \
                           transform_sample(Sample)])
    print new_record

