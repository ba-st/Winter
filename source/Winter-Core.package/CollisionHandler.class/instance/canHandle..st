Testing
canHandle: aCollission
	| firstComponent secondComponent |
	
	firstComponent := aCollission firstComponent.
	secondComponent := aCollission secondComponent.
	^ ((firstComponent isKindOf: firstType) and: [ secondComponent isKindOf: secondType ])
		or: [ (secondComponent isKindOf: firstType) and: [ firstComponent isKindOf: secondType ] ]