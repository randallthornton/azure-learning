param repositoryUrl string = 'https://github.com/randallthornton/azure-learning'
param appServicePlanName string = 'appServicePlan'
param webAppName string 


resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: resourceGroup().location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}
resource webApplication 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
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
  kind: 'GitHub'
  properties: {
    repoUrl: repositoryUrl
    branch: 'main'
    isManualIntegration: true
  }
}
