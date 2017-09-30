Instance Creation
fromPath: aPath

	^ [ self new initializeFromAbsolutePath: aPath ]
		on: FileDoesNotExist
		do: [ :ex | (ex messageText: 'Sprite not found in ',aPath className, ': ' , aPath basename) signal ]