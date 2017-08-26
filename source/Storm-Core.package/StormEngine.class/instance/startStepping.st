stepping
startStepping
	stepping := true.
	steppingProcess := self createSteppingProcess.
	steppingProcess resume.