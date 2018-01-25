Accessing
regionHeight: anInteger

	self isFlippedY
		ifTrue: [ self v: (v2 + anInteger) / texture height  asFloat ]
		ifFalse: [ self v2: (v + anInteger) / texture height  asFloat ]