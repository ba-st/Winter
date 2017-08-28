accessing
friction
	^ self ffiCall:  #( cpFloat cpShapeGetFriction(self) )