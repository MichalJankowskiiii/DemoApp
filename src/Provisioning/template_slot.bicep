param name string
param location string
param hostingPlanName string
param alwaysOn bool
param ftpsState string
param sku string
param skuCode string
param phpVersion string
param netFrameworkVersion string

resource serverFarm 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: hostingPlanName
  location: location
  sku: {
    tier: sku
    name: skuCode
  }
  kind: ''
  properties: {
    zoneRedundant: false
  }
}

resource website 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  properties: {
    siteConfig: {
      appSettings: []
      phpVersion: phpVersion
      netFrameworkVersion: netFrameworkVersion
      alwaysOn: alwaysOn
      ftpsState: ftpsState
    }
    serverFarmId: serverFarm.id
    clientAffinityEnabled: true
    httpsOnly: true
    publicNetworkAccess: 'Enabled'
  }
}


resource stagingSlot 'Microsoft.Web/sites/slots@2021-02-01' = {
  name: 'staging'
  parent: website
  location: location
  kind: 'app'
  properties: {
    serverFarmId: serverFarm.id
  }
}

