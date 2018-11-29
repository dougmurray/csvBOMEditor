# csvBOMEditor.py
# Imports an EAGLE created BOM (csv) file and removes all unnecessary
# attributes, allowing for better readability for the PCB assemblier.
# Run csvBOMEditor.py /path/to/file/filename.csv
# Author: Doug Murray
# Date: 2018-11-19
import sys
import pandas as pd

# Using pandas to import and manipulate csv files is far superior than csv module
filename = sys.argv[1]
df = pd.read_csv(filename, header=0, delimiter=',')
print("Before: ", df)

# All attributes to be removed from csv file
deleteAllThese = ['Device', 'Package', 'Description', 'INTERNALCLK', 'MANUF', 'TOLERANCE', 'TYPE', 'POWER', 'COLOR', 'VALUE', 'VOLTAGE']

# Delete unnecessary attributes
for i, element in enumerate(deleteAllThese):
	try:
		del df[element]
	except KeyError:
		print("No ", element)

# Print and export back to csv file
print("After: ", df)
df.to_csv(filename, sep=',')