Initialization
value
	(firstComponent boundingShape intersect: secondComponent boundingShape)
		ifTrue: [ (Collision between: firstComponent and: secondComponent) applyOnGame ]