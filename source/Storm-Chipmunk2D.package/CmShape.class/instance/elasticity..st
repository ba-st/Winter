accessing
elasticity: aFloat
	^ self ffiCall:  #( void cpShapeSetElasticity(self, cpFloat aFloat) )