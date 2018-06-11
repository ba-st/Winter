Testing
isOccupiedAt: aPosition

	^self components anySatisfy: [ :component | component position = aPosition ]