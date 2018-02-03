Instance Creation
loadFromPath: aStringPath

	^ [ self new initializeFromPath: aStringPath asPath ]
		on: FileDoesNotExist
		do:
			[ :ex | (ex messageText: ('TiledMap not found in <1s>' expandMacrosWith: aStringPath)) signal ]