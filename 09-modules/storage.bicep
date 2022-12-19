// three required parameters
param parStorageAccounts array
param parLocation string

resource account 'Microsoft.Storage/storageAccounts@2022-09-01' = [for sa in parStorageAccounts: {
  name: sa.name
  location: parLocation
  kind: 'StorageV2'
  sku: {
    name: sa.sku
  }
  properties: {
    supportsHttpsTrafficOnly: true
    accessTier: sa.accessTier
  }

}]

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = [for sa in parStorageAccounts: {
  name: '${sa.name}/default/mycontainer'
  dependsOn: [
    account
  ]
}]


// output storage account names
output storageAccountNames array = [for sa in parStorageAccounts: sa.name]
