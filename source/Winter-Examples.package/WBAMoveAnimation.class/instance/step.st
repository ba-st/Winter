Stepping
step
	self movingElement shiftBy: shiftIncr.
	self isMidAnimation ifTrue: [ self midAnimation ].
	self isEndAnimation ifTrue: [ self movingElement finishMoveAnimation ] 