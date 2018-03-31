initialization
initialize

	super initialize.
	stepping := false.
	gameStepActions := Dictionary new.
	process := self createSteppingProcess 
