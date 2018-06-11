Stepping
step
	(self isAnimationSplit: 8) ifTrue: [ character dieRotation ].
	self isEndAnimation ifTrue: [ character bury ] 