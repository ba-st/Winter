Managing
cellsAtX: anX andY: anY put: aCell

	(anX between: 1 and: width)
		ifFalse: [ Error signal: ('Invalid X: <1s>' expandMacrosWith: anX asString) ].
	(anY between: 1 and: height)
		ifFalse: [ Error signal: ('Invalid Y: <1s>' expandMacrosWith: anY asString) ].
		
	cells at: anX at: anY put: aCell