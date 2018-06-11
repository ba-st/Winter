initialization
initialStep: startStep
	super initialStep: startStep.
	self movingElement shiftBy: (startStep * shiftIncr)