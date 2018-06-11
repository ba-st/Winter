animations
die
	isMoving := true.
	scheduler stopGameTickActionFor: self.
	scheduler 
		newGameTickAction: (WBADieAnimation new
			character: self;
			yourself)
		for: self