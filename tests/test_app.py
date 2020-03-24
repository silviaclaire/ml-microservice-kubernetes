import json
import urllib.request

url = "http://localhost:8000/predict"
data = {
    "CHAS": {"0": 0},
    "RM": {"0": 6.575},
    "TAX": {"0": 296.0},
    "PTRATIO": {"0": 15.3},
    "B": {"0": 396.9},
    "LSTAT": {"0": 4.98},
}
headers = {"Content-Type": "application/json"}

req = urllib.request.Request(url, json.dumps(data).encode(), headers)

with urllib.request.urlopen(req) as res:
    body = json.load(res)

assert body["prediction"][0] == 20.35373177134412
