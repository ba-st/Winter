Instance Creation
fromRelativePath: aStringPath
	| type substrings |
	substrings := aStringPath substrings: '.'.
	type := substrings last.
	[ type = 'wav'
		ifTrue: [ ^ self new
				initializeSound: (SampledSound fromWaveFileNamed: aStringPath)
				type: type
				filePath: aStringPath ].
	type = 'aiff'
		ifTrue: [ ^ self new
				initializeSound: (SampledSound fromAIFFfileNamed: aStringPath)
				type: type
				filePath: aStringPath ] ]
		on: FileDoesNotExistException
		do: [ :ex | 
			(FileDoesNotExist
				signal: 'File does not exist: ' , aStringPath)
				signal ].
	SoundExtensionNotSupported
		signal:
			type asString
				,
					' not supported, only .aiff and .wav extension supported for now'