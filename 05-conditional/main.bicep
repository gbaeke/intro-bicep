param parLocation string = 'westeurope'

param parDeployKeyVault bool = false

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'stggeba266372'
  location: parLocation
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }

  resource service 'blobServices' = {
    name: 'default'

    resource othercontainer 'containers' = {
      name: 'othercontainer'
      properties: {
        publicAccess: 'None'

      }
    }
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: '${storageaccount.name}/default/mycontainer'
  properties: {
    publicAccess: 'None'
  }
}


resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = if (parDeployKeyVault) {
  name: 'kvgeba266372'
  location: parLocation
  dependsOn: [
    storageaccount
  ]
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
  } 
  
}



