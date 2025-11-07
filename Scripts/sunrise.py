import requests
import subprocess
import time
from datetime import datetime, timedelta, timezone
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# Set your location (latitude, longitude)
LATITUDE = 57.70716
LONGITUDE = 11.96679

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

def get_sunrise_time(lat, lng):
    session = get_session_with_retries()
    url = f"https://api.sunrise-sunset.org/json?lat={lat}&lng={lng}&formatted=0"
    response = session.get(url)
    data = response.json()
    sunrise_utc = data['results']['sunrise']
    sunrise_dt = datetime.fromisoformat(sunrise_utc)
    sunrise_local = sunrise_dt.astimezone()  # Converts to local timezone
    return sunrise_local

def wait_until(target_time):
    # Ensure both now and target_time are timezone-aware (UTC)
    if target_time.tzinfo is not None:
        def get_now():
            return datetime.now(target_time.tzinfo)
    else:
        def get_now():
            return datetime.now()
    while True:
        now = get_now()
        if now >= target_time:
            break
        time_to_wait = (target_time - now).total_seconds()
        time.sleep(min(time_to_wait, 60))  # Sleep up to 60 seconds

def main():
    sunrise = get_sunrise_time(LATITUDE, LONGITUDE)
    print(f"Sunrise today is at {sunrise.strftime('%Y-%m-%d %H:%M:%S')}")
    wait_until(sunrise)
    # Execute your command
    subprocess.run("killall led-image-viewer", shell=True)
    print("Command executed at sunrise.")

if __name__ == "__main__":
    main()