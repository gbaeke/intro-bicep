// This template deploys a storage account


resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'stggeba266372'
  location: 'westeurope'
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'  // use premium storage
  }
}


