event handling
handleKeyStroke: code

	code = self enterCode ifTrue: [ self nextScreen ].
	self hasPlayerSpecificHandling
		ifTrue: [ self handlePlayersKeyStroke: code ]
		ifFalse: [ self handleGenericKeyStroke: code ]