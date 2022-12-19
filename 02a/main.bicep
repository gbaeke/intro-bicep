// scope set to subscription
// now you can only create subscription level resources
// examples of subscription level resources are:
// - resource groups
// - policy assignments
// - policy definitions
// - role assignments
// - role definitions

targetScope = 'subscription'

param parLocation string = 'westeurope'


// create a resource group
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'otherdemo-rg'
  location: parLocation

}

// create a storage account
// requires a module with scope to rg
module stg 'storage.bicep' = {
  name: 'mystg'
  scope: rg  // set scope to resource group
  params: {
    parLocation: parLocation
    parStorageAccounts: [
      {
        name: 'stggeba721283'
        sku: 'Standard_LRS'
        accessTier: 'Hot'
      }
    ]
  }
}

