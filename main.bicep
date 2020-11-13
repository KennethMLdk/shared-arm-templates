targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: '0dot2release'
  location: 'northeu'
}

module stgMod './storage.bicep' = {
  name: 'storageDeploy' // name for the nested deployment
  scope: resourceGroup(rg.name)
  params: {
    namePrefix: 'alex'
  }
}