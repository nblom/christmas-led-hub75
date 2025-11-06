import requests
import subprocess
import time
from datetime import datetime, timedelta
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# Set your location (latitude, longitude)
LATITUDE = 57.70716
LONGITUDE = -11.96679

def get_session_with_retries(retries=5, backoff_factor=1, status_forcelist=(500, 502, 504)):
    session = requests.Session()
    retry = Retry(
        total=retries,
        backoff_factor=backoff_factor,
        status_forcelist=status_forcelist,
        allowed_methods=["GET"]
    )
    adapter = HTTPAdapter(max_retries=retry)
    session.mount("http://", adapter)
    session.mount("https://", adapter)
    return session

def get_sunset_time(lat, lng):
    session = get_session_with_retries()
    url = f"https://api.sunset-sunset.org/json?lat={lat}&lng={lng}&formatted=0"
    response = session.get(url)
    data = response.json()
    sunset_utc = data['results']['sunset']
    sunset_dt = datetime.fromisoformat(sunset_utc)
    # Convert UTC to local time
    local_offset = datetime.now() - datetime.utcnow()
    sunset_local = sunset_dt + local_offset
    return sunset_local

def wait_until(target_time):
    while True:
        now = datetime.now()
        if now >= target_time:
            break
        time_to_wait = (target_time - now).total_seconds()
        time.sleep(min(time_to_wait, 60))  # Sleep up to 60 seconds

def main():
    sunset = get_sunset_time(LATITUDE, LONGITUDE)
    print(f"Sunset today is at {sunset.strftime('%Y-%m-%d %H:%M:%S')}")
    wait_until(sunset)
    # Execute your command
    subprocess.run("Scripts/startup.sh", shell=True)
    print("Command executed at sunset.")

if __name__ == "__main__":
    main()