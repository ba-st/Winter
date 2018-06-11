animations
move: startStep
	scheduler 
		newGameTickAction: (WBASpellMoveAnimation new
			spell: self;
			direction: direction;
			initialStep: startStep;
			yourself)
		for: self 