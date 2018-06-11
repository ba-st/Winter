animations
every10GameTickDo: aBlock

	startingGame scheduler
		newGameTickAction:
			(WinterScreenAnimation new
				block: aBlock;
				yourself)
		for: self