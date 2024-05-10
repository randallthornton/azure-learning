resource staticWebSite 'Microsoft.Web/staticSites@2023-12-01' = {
  name: 'staticWebSite'
  sku: {
    name: 'Free'
  }
  location: 'eastus2'
  properties: {
    repositoryUrl: 'https://github.com/randallthornton/azure-learning'
    branch: 'main'
    buildProperties: {
      appLocation: '/spa/az-learn'
      outputLocation: '/spa/az-learn/dist'
      appBuildCommand: 'npm ci && npm run build'
    }
  }
}
