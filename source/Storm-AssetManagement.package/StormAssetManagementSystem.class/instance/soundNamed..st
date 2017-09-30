Asset Managing
soundNamed: aName

^sounds at: aName ifAbsent: [AssetNotFound signalNamed: aName].