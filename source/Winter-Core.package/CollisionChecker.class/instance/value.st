Evaluating
value
	self flag: 'Revisar'.
	((firstComponent bounds intersect: secondComponent bounds) = (0 @ 0 extent: 0 @ 0)) not
		ifTrue: [ (Collision between: firstComponent and: secondComponent) applyOnGame ]