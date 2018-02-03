tests
testInstanceCreationFailedBecauseFileNotFound
	self
		should: [ WinterSound fromPath: 'bird2.wav'.]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'File does not exist: bird2.wav' ].