param parStorageAccounts array = [
  {
    name: 'gebastg887822'
    sku: 'Standard_LRS'
  }
  {
    name: 'gebastg887823'
    sku: 'Premium_LRS'
  }
]

param parLocation string = 'westeurope'

// create multiple storage accounts based on the array
resource stgs 'Microsoft.Storage/storageAccounts@2022-09-01' = [for stg in parStorageAccounts: {
  name: stg.name
  kind: 'StorageV2'
  location: parLocation
  sku: {
    name: stg.sku
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
  
}]
