param parPrefix string = 'myPrefix'

@description('This is a description')
param parString string = 'somevalue${parPrefix}'  // string interpolation example

@secure()
param parSecureString string

@minValue(0)
@maxValue(100)
param parInt int = 0


param parBool bool = true

param parArray array = [
  'item1'
  'item2'
]

param parObject object = {
  key1: 'value1'
  key2: 'value2'
}

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Premium_LRS'
])
param parStorageType string
