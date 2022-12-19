// owner role id
param roleOwnerGuid string = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
param parRgName string


// assign owner role to Azure AD group students
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(parRgName, roleOwnerGuid)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleOwnerGuid)
    principalType: 'Group'
    principalId: '34df8880-9fe0-4516-ac33-d9b376129c32'  // students group
  }
}
