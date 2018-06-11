actions
switchToNextScreen
	currentChoice = 0 
		ifTrue: [ self nextScreen: WBAArenaSelectScreenModel ]
		ifFalse: [ 
			startingGame scheduler terminateProcess.
			WBANumberPlayerSelectScreenModel new
				screen: screen;
				display ]