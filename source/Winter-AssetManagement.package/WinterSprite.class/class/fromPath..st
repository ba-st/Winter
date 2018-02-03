Instance Creation
fromPath: aStringPath

	^ [ self new initializeFromAbsolutePath: aStringPath asPath ]
		on: FileDoesNotExist
		do:
			[ :ex | (ex messageText: ('Sprite not found in <1s>' expandMacrosWith: aStringPath)) signal ]