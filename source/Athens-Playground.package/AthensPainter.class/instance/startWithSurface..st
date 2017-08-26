stepping
startWithSurface: aSurface
	setupBlock 
		ifNotNil: [ aSurface drawDuring: setupBlock ].
		
	self isStepping 
		ifTrue: [ self stepWithSurface: aSurface ]
		ifFalse: [ self drawWithSurface: aSurface ].