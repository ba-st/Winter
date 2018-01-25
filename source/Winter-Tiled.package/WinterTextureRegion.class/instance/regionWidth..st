Accessing
regionWidth: anInteger

	self isFlippedX
		ifTrue: [ self u: (u2 + anInteger) / texture width asFloat ]
		ifFalse: [ self u2: (u + anInteger) / texture width asFloat ]