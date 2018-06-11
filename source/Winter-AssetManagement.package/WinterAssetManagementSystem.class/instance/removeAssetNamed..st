Asset Managing
removeAssetNamed: aName
	^assets  removeKey: aName ifAbsent: [ AssetNotFound signalNamed: aName ]