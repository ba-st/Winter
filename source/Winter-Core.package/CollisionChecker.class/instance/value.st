Evaluating
value

	(firstComponent collisionShape intersects: secondComponent collisionShape)
		ifTrue: [ (Collision between: firstComponent and: secondComponent) applyOnGame ]