
import http.client
import json 

username = "201933046723"
password = "e3cF7uST"

serverUrl = "progres.mesrs.dz"

#post username and password
authApi = "api/authentication/v1/"

# header authorization :token
studentCardApi = "api/infos/bac/$bacYearToken/$bacIdToken/dias"
bacNoteApi = "api/infos/bac/$bacYearToken/$bacIdToken/notes"
bacApi = "api/infos/bac/$bacYearToken/$bacIdToken"


def getStudentCard(bacYear, bacId,authToken):
    conn = http.client.HTTPSConnection(serverUrl)
    headers = {
        'authorization': authToken
    }
    url = studentCardApi.replace("$bacYearToken", bacYear).replace("$bacIdToken", bacId)
    print(url)

    conn.request("GET", url, headers=headers)
    

    res = conn.getresponse()
    data = res.read()
    return data.decode("utf-8")


def getBacNote(bacYear, bacId,authToken):
    conn = http.client.HTTPSConnection(serverUrl)
    headers = {
        'Authorization': authToken
    }
    conn.request("GET", bacNoteApi.replace("$bacYearToken", bacYear).replace("$bacIdToken", bacId), headers=headers)
    res = conn.getresponse()
    data = res.read()
    return data.decode("utf-8")

def getToken(username, password):
    conn = http.client.HTTPSConnection(serverUrl)
    headers = {
        'content-type': "application/json"
    }
    body = {
        "username": username,
        "password": password
    }
    body = json.dumps(body).encode('utf-8')  # Convert body to JSON and encode to bytes

    conn.request("POST", authApi, body, headers)
    res = conn.getresponse()
    data = res.read()
    return data.decode("utf-8")

def getBac(bacYear, bacId,authToken):
    conn = http.client.HTTPSConnection(serverUrl)
    headers = {
        'Authorization': authToken
    }
    url = bacApi.replace("$bacYearToken", bacYear).replace("$bacIdToken", bacId)
    print(url)
    conn.request("GET", url, headers=headers)
    res = conn.getresponse()
    data = res.read()
    return data.decode("utf-8")

# authToken = getToken(username, password)
authToken = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDE5MzMwNDY3MjMiLCJpZENvbXB0ZSI6NjMzMTAwMiwiaWRFdGFibGlzc2VtZW50IjoxMzY5NTQsImlkSW5kaXZpZHUiOjM2OTU3NzcwLCJ1c2VyTmFtZSI6IjIwMTkzMzA0NjcyMyIsImV4cCI6MTcwOTU4MzkzMCwiaWF0IjoxNzA3MDc4MzMwfQ.LYrnJUEgCjTduz25_yYJL4YcueZFFtWLijOBSWhmn0I" #getToken(username, password)

print(getBac("2019", "33046723",authToken))

