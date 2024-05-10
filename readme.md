# Azure Learning!

## Deploying the Api

Create a resource group with AZ

```powershell
az group create --name az-learn-group --location 'eastus'
```

Deploy the Api

```powershell
az deployment group create --resource-group az-learn-group --template-file .\app-service\main.bicep
```

```powershell
az deployment group create --resource-group az-learn-group --template-file .\static-websites\main.bicep
```
