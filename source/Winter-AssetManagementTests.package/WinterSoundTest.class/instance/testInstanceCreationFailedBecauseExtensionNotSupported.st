tests
testInstanceCreationFailedBecauseExtensionNotSupported
	self
		should: [ WinterSound fromPath: 'bird2.mp3' named: 'bird'.]
		raise: SoundExtensionNotSupported 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'mp3 not supported, only .aiff and .wav extension supported for now' ].