accessing
takeObjects
	| takenObjects |
	
	mutex critical: [
		takenObjects := objects.
		objects := self newCollection ].
	
	^takenObjects