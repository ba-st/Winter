tests
testInstanceCreationFailedBecauseFileNotFound
	self
		should: [ StormSound fromRelativePath: 'bird2.wav'.]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'File does not exist: bird2.wav' ].