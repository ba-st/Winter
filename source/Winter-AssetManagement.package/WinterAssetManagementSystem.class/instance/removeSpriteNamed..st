Asset Managing
removeSpriteNamed: aName
	^sprites removeKey: aName ifAbsent: [ AssetNotFound signalNamed: aName ]