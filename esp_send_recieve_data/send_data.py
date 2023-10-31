import requests
import time
# Set the URL of your ESP8266 server
url = "http://192.168.4.1/post_data"

# Replace 'your_esp8266_ip' with the actual IP address of your ESP8266

# Define the data you want to send (an integer in this case)
data_to_send = 500  # Replace with your desired integer

# Convert the data to a string
data_as_string = str(data_to_send)

# Create a dictionary with the data
data = {"plain": data_as_string}

# Send the POST request
while True:
    response = requests.post(url, data=data)

    # Check the response from the server
    if response.status_code == 200:
        print(int(time.time()), "Data sent successfully")
    else:
        print(int(time.time()), "Failed to send data")

