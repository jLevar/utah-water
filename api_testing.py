import json
import requests

def json_to_file(json_data: dict, file_path: str) -> None:
    with open(file_path, "w") as output_file:
        json.dump(json_data, output_file, indent=4)


def get_all_utah_monitoring_locations() -> dict:
    endpoint = "https://api.waterdata.usgs.gov/ogcapi/v0/collections/monitoring-locations/items"
    params = {
        "f": "json",
        "limit": "50000",    
        "state_code": "49"
    }

    response = requests.get(endpoint, params=params)
    return response.json()


monitoring_locations = get_all_utah_monitoring_locations()
json_to_file(monitoring_locations, "data/response.json")