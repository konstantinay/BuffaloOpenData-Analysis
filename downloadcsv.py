import requests

url = "https://data.buffalony.gov/resource/2cjd-uvx7.csv"

response = requests.get(url)    #get request to url
#create csv file and write content from from response object of requests module
open("data.csv", "wb").write(response.content)


