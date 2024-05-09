// Create a storage account
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: 'storageaccountname'
  location: 'westus'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
