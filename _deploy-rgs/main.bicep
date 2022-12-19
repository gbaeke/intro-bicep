targetScope='subscription'

param rgNames array = [ 'rg-student1', 'rg-student2', 'rg-student3' ]
param parLocation string = 'westeurope'

// create resource groups with for loop
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = [for rgName in rgNames: {
  name: rgName
  location: parLocation
}]

module role 'role.bicep' = [for rgName in rgNames: {
  name: rgName
  scope: resourceGroup(rgName)
  params: {
    parRgName: rgName
  }
  dependsOn: [
    rg
  ]
}]
