accessing
stepTime
	^stepTime ifNil: [ stepTime := self class defaultStepTime ]