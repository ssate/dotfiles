import requests
import os

response = requests.get('https://api.gemini.com/v1/pricefeed')
jsonResponse = response.json()

for i in jsonResponse:
    if i["pair"] == "ETHUSD":
        percentChange = str(round((float(i["percentChange24h"]) * 100), 2))
        price = str("$" + format(float(i["price"]), ","))
        os.system('sketchybar -m --set eth label=\'' + price + ' (' + percentChange + '%)\'')
        if "-" in percentChange:
            os.system('sketchybar -m --set eth background.color=0xffbf616a')
        else:
            os.system('sketchybar -m --set eth background.color=0xffa3be8c')
        break
