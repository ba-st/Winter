private
guessTypeForName: aString
	bindings ifNotNil: [ 
		(attributeBindings 
			at: aString
			ifAbsent: [ nil ])
			ifNotNil: [ :binding | ^binding class ] ].

	^ nil