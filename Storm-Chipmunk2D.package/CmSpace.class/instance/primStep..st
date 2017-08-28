private
primStep: time
	^ self ffiCall: #(void cpSpaceStep(self, cpFloat time))