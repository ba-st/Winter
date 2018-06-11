Stepping
step
	self isEndAnimation ifTrue: [ spell endExplodeAnimation ].
	(self isAnimationSplit: 3) ifTrue: [ spell nextSprite ]