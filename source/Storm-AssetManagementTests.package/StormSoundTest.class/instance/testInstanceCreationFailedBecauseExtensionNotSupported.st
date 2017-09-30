tests
testInstanceCreationFailedBecauseExtensionNotSupported
	self
		should: [ StormSound fromRelativePath: 'bird2.mp3'.]
		raise: SoundExtensionNotSupported 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'mp3 not supported, only .aiff and .wav extension supported for now' ].