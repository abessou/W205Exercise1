#!/usr/bin/python
import sys
import string


for line in sys.stdin:
    line = line.strip("\n ")

    ProviderId, \
    MeasureId, \
    ComparedToNational, \
    Denominator, \
    Score = line.split("\t")

    new_record = "\t".join([ProviderId, \
                           MeasureId, \
                           ComparedToNational, \
                           Denominator \
                           if Denominator!="Not Available" \
                           else "-1" , \
                           Score \
                           if Score!="Not Available" \
                           else "-1"])    
    print new_record
