constraint
addConstraint: aConstraint
	self flag: #todo.
	^ self ffiCall: #(CmExternalConstraint cpSpaceAddConstraint(self, CmExternalConstraint aConstraint))