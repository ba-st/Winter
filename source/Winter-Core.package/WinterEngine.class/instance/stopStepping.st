stepping
stopStepping
	[ steppingProcess terminate ]
	ensure: [ stepping := false ]