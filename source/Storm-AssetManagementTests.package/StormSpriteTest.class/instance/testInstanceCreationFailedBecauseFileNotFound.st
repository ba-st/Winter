tests
testInstanceCreationFailedBecauseFileNotFound
	self
		should: [ StormSprite fromRelativePath: 'pharo2.png' ]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Sprite not found in RelativePath: pharo2.png' ].
	