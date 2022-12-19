// deploy storage account with module

param parLocation string = resourceGroup().location

param parStorageAccounts array = [
  {
    name: 'gebastg88782234'
    sku: 'Standard_LRS'
    accessTier: 'Hot'
  }
  {
    name: 'gebastg88782334'
    sku: 'Premium_LRS'
    accessTier: 'Hot'
  }
]

module accounts 'br:bicepd25j6oel4cwxu.azurecr.io/bicep/modules/storage:v1.0.0' = {
  name: 'sa'
  params: {
    parStorageAccounts: parStorageAccounts
    parLocation: parLocation
  }
}
