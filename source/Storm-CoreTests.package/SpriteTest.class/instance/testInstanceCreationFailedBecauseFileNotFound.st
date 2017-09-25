tests
testInstanceCreationFailedBecauseFileNotFound
	self
		should: [ StormSprite fromAbsolutePath: 'home/alvaro/Escritorio/pharo-trans2.png' ]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Sprite not found in AbsolutePath: home/alvaro/Escritorio/pharo-trans2.png' ].
	self
		should: [ StormSprite fromRelativePath: 'pharo-trans2.png' ]
		raise: FileDoesNotExist
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Sprite not found in RelativePath: pharo-trans2.png' ]