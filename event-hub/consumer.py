# Create azure event hub consumer

from azure.eventhub import EventHubConsumerClient
from azure.eventhub.extensions.checkpointstoreblobaio import (BlobCheckpointStore)

# Get the connection string from the environment variable
CONNECTION_STRING = ""

# Create a consumer client
consumer = EventHubConsumerClient.from_connection_string(
    CONNECTION_STRING,
    consumer_group="$Default",
)

# Create a checkpoint store
checkpoint_store = BlobCheckpointStore.from_connection_string("""
""")

# Subscribe to messages
def on_event(partition_context, event):
    # Print the event data
    print(event.body_as_str())

    # Update the checkpoint
    partition_context.update_checkpoint(event)

with consumer:
    consumer.receive(on_event, checkpoint_store=checkpoint_store)

