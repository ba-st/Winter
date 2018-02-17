Managing
tilesAt: anId

	^tileSets  detect: [:each | each hasTileWithId: anId]  ifFound: [ :tileSet | tileSet tilesAt: anId  ]  ifNone: [ nil ]