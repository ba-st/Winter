Asset Managing
assetNamed: aName

	^ self assetNamed: aName ifAbsent: [ AssetNotFound signalNamed: aName ]