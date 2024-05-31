
// Event Hub

resource ehnamespace 'Microsoft.EventHub/namespaces@2021-11-01' = {
  name: 'eventhub-ns-randong'
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

resource eventHub 'Microsoft.EventHub/namespaces/eventhubs@2021-11-01' = {
  parent: ehnamespace
  name: 'eventhub'
  properties: {
    messageRetentionInDays: 1
    partitionCount: 1
    status: 'Active'
  }
}
