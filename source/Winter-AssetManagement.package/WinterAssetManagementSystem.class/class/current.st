Singleton
current
	uniqueInstance isNil
		ifTrue: [ uniqueInstance := self new ].
	^ uniqueInstance