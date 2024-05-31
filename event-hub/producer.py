# Create a producer for azure event hub
import os
import json
import time
from azure.eventhub import EventHubProducerClient, EventData

# Get the connection string from the environment variable
CONNECTION_STRING = ""

# Create a producer client
producer = EventHubProducerClient.from_connection_string(CONNECTION_STRING)

# Create a message to send
message = json.dumps({
    "message": "Hello from Python!",
    "timestamp": time.time()
})

# Send the message

with producer:
    producer.send_event(EventData(message))

print("Message sent!")
