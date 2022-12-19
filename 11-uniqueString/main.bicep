param parLocation string = 'westeurope'

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'stg${uniqueString(resourceGroup().id)}'  // generates deterministic unique name based on resource group id
  location: parLocation
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}


