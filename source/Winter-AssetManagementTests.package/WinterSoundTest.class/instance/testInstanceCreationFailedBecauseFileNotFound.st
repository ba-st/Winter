tests
testInstanceCreationFailedBecauseFileNotFound
	self
		should: [ WinterSound fromPath: 'bird2.wav' named: 'bird2'.]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'File does not exist: bird2.wav' ].