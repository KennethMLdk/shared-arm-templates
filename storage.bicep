param namePrefix string {
  allowed: [
    'alex'
    'satya'
  ]
}

resource myStorage 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: '${namePrefix}${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {}
  tags: {}
}

output blobEndpoint string = myStorage.properties.primaryEndpoints.blob