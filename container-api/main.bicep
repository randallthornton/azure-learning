resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: 'containerGroup'
  location: resourceGroup().location
  properties: {
    osType: 'Linux'
    restartPolicy: 'Always'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
      ]
    }
    containers: [
      {
        name: 'nginx'
        properties: {
          image: 'nginx'
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 2
            }
          }
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
          ]
        }
      }
    ]
  }
}
