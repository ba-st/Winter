accessing
elasticity: aFloat
	^ self indirectCall: #( void cpShapeSetElasticity(self, cpFloat aFloat) )