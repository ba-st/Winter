Asset Managing
removeSoundNamed: aName
	^sounds removeKey: aName ifAbsent: [ AssetNotFound signalNamed: aName ]