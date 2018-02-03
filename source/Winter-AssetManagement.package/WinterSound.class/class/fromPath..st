Instance Creation
fromPath: aStringPath
	| type substrings |
	substrings := aStringPath substrings: '.'.
	type := substrings last.
	[ type = 'wav'
		ifTrue: [ ^ self 
				from: (SampledSound fromWaveFileNamed: aStringPath)
				fileType: type
				filePath: aStringPath ].
	type = 'aiff'
		ifTrue: [ ^ self 
				from: (SampledSound fromAIFFfileNamed: aStringPath)
				fileType: type
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