animations
nextAnimation
	scheduler stopGameTickActionFor: self.
	(cell element allowMovement or: [cell element = character]) ifTrue: [ 
		currentSprite < 3 ifTrue: [ self nextSprite ].
		^ self move: 0 ].
	self explodeAnimation.