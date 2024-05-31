
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

resource eventHubConsumerGroup 'Microsoft.EventHub/namespaces/eventhubs/consumergroups@2021-11-01' = {
  parent: eventHub
  name: 'eventhub-consumer-group'
  properties: {
  }
}

// Create storage account for checkpointing
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'storageaccountrandong'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
  }
}
