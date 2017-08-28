accessing
elasticity
	^ self ffiCall:  #( cpFloat cpShapeGetElasticity(self) )