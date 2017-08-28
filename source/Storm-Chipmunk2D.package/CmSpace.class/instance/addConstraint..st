constraint
addConstraint: aConstraint
	self flag: #todo.
	^ self ffiCall: #(cpConstraint cpSpaceAddConstraint(self, cpConstraint *aConstraint))