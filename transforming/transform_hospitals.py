#!/usr/bin/python
import sys
import string

for line in sys.stdin:
        stripped_line = line.strip("\n ")
        ProviderId, Name, Address, City, State, Zipcode, County, Phone, Type, Ownership = stripped_line.split("\t")
        print "\t".join([ProviderId, Name, Address, City, State, Zipcode, County, Phone, Type, Ownership])
