# Data Extraction and Parsing

This directory contains data files and Python code used to extract and parse data using the Garmin API. The API is accessed through the [python-garminconnect](https://github.com/cyberjunky/python-garminconnect) library.

# Use

To run the data extraction and parsing script:

1. **Initialize the environment**:
    ```sh
    uv init
    ```

2. **Set up your Garmin credentials**:
    Ensure you have your Garmin username and password ready. You will need these to authenticate with the Garmin API when running `getData.py`.

3. **Run the scripts to get the data and then parse it into a .csv**:
    ```sh
    uv run getData.py
    uv run extractData.py
    ```

This will start the data extraction process and save the parsed data to the specified output directory.