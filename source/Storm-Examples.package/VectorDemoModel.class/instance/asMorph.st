as yet unclassified
asMorph
	morph ifNil:[morph := LabelMorph new contents: contents printString;yourself.
		self whenChangedDo: [:e | morph contents: contents printString. ].].
	
	^morph