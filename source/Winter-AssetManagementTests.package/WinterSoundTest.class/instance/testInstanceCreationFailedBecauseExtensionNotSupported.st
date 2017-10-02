tests
testInstanceCreationFailedBecauseExtensionNotSupported
	self
		should: [ WinterSound fromRelativePath: 'bird2.mp3'.]
		raise: SoundExtensionNotSupported 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'mp3 not supported, only .aiff and .wav extension supported for now' ].