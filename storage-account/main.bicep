// Create a storage account

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: 'azlearnstorage868'
  location: 'eastus'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
