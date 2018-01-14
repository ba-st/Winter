Instance Creation
loadFromPath: aPath
	^ [ self new initializeFromPath: aPath ]
		on: FileDoesNotExist
		do:
			[ :ex | (ex messageText: 'TiledMap not found in ' , aPath className , ': ' , aPath basename) signal ]