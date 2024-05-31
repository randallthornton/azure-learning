
// Event Hub

resource ehnamespace 'Microsoft.EventHub/namespaces@2024-01-01' = {
  name: 'eventhub-ns'
  location: resourceGroup().location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
  properties: {
    isAutoInflateEnabled: false
    maximumThroughputUnits: 0
  }
}

resource eventHub 'Microsoft.EventHub/namespaces/eventhubs@2024-01-01' = {
  parent: ehnamespace
  name: 'eventhub'
  properties: {
    messageRetentionInDays: 1
    partitionCount: 1
  }
}
