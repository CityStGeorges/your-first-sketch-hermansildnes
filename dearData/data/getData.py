# Some code ripped from https://github.com/cyberjunky/python-garminconnect examples
# And parts generated with the help of Claude 3.5 Sonnet (Nov 2024)

from datetime import date, timedelta
from garth.exc import GarthHTTPError
import requests

from garminconnect import (
    Garmin,
    GarminConnectAuthenticationError,
)
import os
from getpass import getpass
import json

email = os.getenv("EMAIL")
password = os.getenv("PASSWORD")
tokenstore = os.getenv("GARMINTOKENS") or "~/.garminconnect"
tokenstore_base64 = os.getenv("GARMINTOKENS_BASE64") or "~/.garminconnect_base64"
api = None


def get_credentials():
    """Get user credentials."""

    email = input("Login e-mail: ")
    password = getpass("Enter password: ")

    return email, password


def init_api(email, password):
    """Initialize Garmin API with your credentials."""

    try:
        # Using Oauth1 and OAuth2 token files from directory
        print(
            f"Trying to login to Garmin Connect using token data from directory '{tokenstore}'...\n"
        )

        garmin = Garmin()
        garmin.login(tokenstore)

    except (FileNotFoundError, GarthHTTPError, GarminConnectAuthenticationError):
        # Session is expired. You'll need to log in again
        print(
            "Login tokens not present, login with your Garmin Connect credentials to generate them.\n"
            f"They will be stored in '{tokenstore}' for future use.\n"
        )
        try:
            # Ask for credentials if not set as environment variables
            if not email or not password:
                email, password = get_credentials()

            garmin = Garmin(
                email=email, password=password, is_cn=False, prompt_mfa=get_mfa
            )
            garmin.login()
            # Save Oauth1 and Oauth2 token files to directory for next login
            garmin.garth.dump(tokenstore)
            print(
                f"Oauth tokens stored in '{tokenstore}' directory for future use. (first method)\n"
            )
            # Encode Oauth1 and Oauth2 tokens to base64 string and safe to file for next login (alternative way)
            token_base64 = garmin.garth.dumps()
            dir_path = os.path.expanduser(tokenstore_base64)
            with open(dir_path, "w") as token_file:
                token_file.write(token_base64)
            print(
                f"Oauth tokens encoded as base64 string and saved to '{dir_path}' file for future use. (second method)\n"
            )
        except (
            FileNotFoundError,
            GarthHTTPError,
            GarminConnectAuthenticationError,
            requests.exceptions.HTTPError,
        ) as err:
            return None

    return garmin


def get_mfa():
    """Get MFA."""

    return input("MFA one-time code: ")


def daterange(start_date: date, end_date: date):
    days = int((end_date - start_date).days)
    for n in range(days):
        yield start_date + timedelta(n)


def display_json(api_call, output):
    """Format API output for better readability."""

    dashed = "-" * 20
    header = f"{dashed} {api_call} {dashed}"
    footer = "-" * len(header)

    print(header)

    if isinstance(output, (int, str, dict, list)):
        print(json.dumps(output, indent=4))
    else:
        print(output)

    print(footer)


running = True
while running:
    if not api:
        print("Trying to initialize Garmin API...\n")
        api = init_api(email, password)

    if api:

        start_date = date(2024, 10, 4)
        end_date = date(2024, 11, 18)

        output_file = "sleep_data.json"
        print(f"Writing sleep data to {output_file}...")
        with open(output_file, "w") as f:
            f.write("[\n")
            for single_date in daterange(start_date, end_date):
                sleep_data = api.get_sleep_data(single_date.isoformat())
                f.write(json.dumps(sleep_data, indent=4))
                f.write(",\n")
            f.write("]\n")

        running = False

    else:
        api = init_api(email, password)
