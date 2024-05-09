param repositoryUrl string = 'https://github.com/randallthornton/azure-learning'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'appServicePlan'
  location: resourceGroup().location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}
resource webApplication 'Microsoft.Web/sites@2023-12-01' = {
  name: 'az-learn-web-app-89'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '10.14.1'
        }
      ]
    }
  }
}

resource srcControls 'Microsoft.Web/sites/sourcecontrols@2023-12-01' = {
  parent: webApplication
  name: 'web'
  properties: {
    repoUrl: repositoryUrl
    branch: 'main'
    isManualIntegration: true
  }
}
