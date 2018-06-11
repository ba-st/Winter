animations
explodeAnimation
	| step |
	step := 0.
	cell element die.
	self nextSprite.
	scheduler 
		newGameTickAction: (WBAExplodeAnimation new
			spell: self;
			yourself)
		for: self