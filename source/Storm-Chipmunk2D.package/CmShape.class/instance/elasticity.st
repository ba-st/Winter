accessing
elasticity
	^ self indirectCall: #( cpFloat cpShapeGetElasticity(self) )