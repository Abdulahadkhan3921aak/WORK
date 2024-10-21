import json
import csv

# Open the JSON file for reading
with open('000413.json', 'r') as json_file:
    data = json.load(json_file)

# Specify the CSV file name
csv_file = 'output.csv'

# Open the CSV file for writing with '|' as the delimiter and no quoting
with open(csv_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter='|',
                        quoting=csv.QUOTE_NONE, escapechar='')

    # Write the header row with field names separated by "|"
    field_names = ["|"] + list(data["1.1.1"].keys())
    writer.writerow(field_names)

    # Iterate through each entry in the data and write the values to the CSV
    for key, entry in data.items():
        values = ["|" + str(entry[field]) for field in entry.keys()]
        writer.writerow([key] + values)
