animations
move: index
	isMoving := true.
	currentFoot := 1.
	scheduler 
		newGameTickAction: (WBACharacterMoveAnimation new
			character: self;
			direction: index;
			yourself)
		for: self 