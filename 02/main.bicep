param parLocation string

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'stggeba266372'
  location: parLocation
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}


