Asset Managing
spriteNamed: aName

^sprites at: aName ifAbsent: [AssetNotFound signalNamed: aName].