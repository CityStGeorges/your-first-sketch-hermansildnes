# Parts generated with the help of Claude 3.5 Sonnet (Nov 2024), to understand the formatting of the data.

import json
import csv
from datetime import datetime
import os

input_file = "sleep_data.json"
output_file = "durations.csv"

if not os.path.exists(input_file):
    print(f"File not found: {input_file}")
    exit()

try:
    with open(input_file, "r") as f:
        content = f.read()
    print(
        "Raw File Contents:", content[:500]
    )  # Print first 500 characters for verification
    sleep_data = json.loads(content)
except Exception as e:
    print(f"Error reading or parsing file: {e}")
    exit()

# Process data
durations = []
for entry in sleep_data:
    daily_sleep = entry.get("dailySleepDTO")
    if daily_sleep:
        sleep_start = daily_sleep.get("sleepStartTimestampLocal")
        sleep_end = daily_sleep.get("sleepEndTimestampLocal")
        calendar_date = daily_sleep.get("calendarDate")
        if sleep_start and sleep_end:
            sleep_duration_seconds = (
                sleep_end - sleep_start
            ) // 1000  # Convert milliseconds to seconds

            sleep_start_time = datetime.utcfromtimestamp(sleep_start / 1000).strftime(
                "%H:%M"
            )
            sleep_end_time = datetime.utcfromtimestamp(sleep_end / 1000).strftime(
                "%H:%M"
            )

            durations.append(
                {
                    "date": calendar_date,
                    "sleepStart": sleep_start_time,
                    "sleepEnd": sleep_end_time,
                    "sleepDurationSeconds": sleep_duration_seconds,
                }
            )

if not durations:
    print("No valid entries found in sleep data.")
    exit()

# Write processed data to CSV
try:
    with open(output_file, "w", newline="") as csvfile:
        fieldnames = ["date", "sleepStart", "sleepEnd", "sleepDurationSeconds"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()
        for row in durations:
            writer.writerow(row)
    print(f"Processed data written to: {output_file}")
except Exception as e:
    print(f"Error writing output file: {e}")
