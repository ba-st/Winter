Tests
testInstanceCreationFailedBecauseFileNotFound
	self
		should: [ WinterSprite fromPath: 'pharo2.png' named: 'pharo 2']
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Sprite not found in pharo2.png' ].
	