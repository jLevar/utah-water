import json
import requests

UTAH_STATE_CODE = 49

monitoring_locations_endpoint = "https://api.waterdata.usgs.gov/ogcapi/v0/collections/monitoring-locations/items"

response = requests.get(f"{monitoring_locations_endpoint}?state_code={UTAH_STATE_CODE}")
response_json = response.json()
# data = json.dumps(response_json, indent=4)

with open("data/response.json", "w") as outfile:
    json.dump(response_json, outfile, indent=4)
