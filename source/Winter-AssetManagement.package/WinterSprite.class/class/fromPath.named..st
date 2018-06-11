Instance Creation
fromPath: aStringPath named: aName

	^ [ self new initializeFromAbsolutePath: aStringPath  named: aName ]
		on: FileDoesNotExist
		do:
			[ :ex | (ex messageText: ('Sprite not found in <1s>' expandMacrosWith: aStringPath)) signal ]