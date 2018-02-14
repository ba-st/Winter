Accessing
parent: aLayer

	aLayer = self
		ifTrue: [ Error signal: 'Parent can not be self' ]
		ifFalse: [ parent := aLayer ]