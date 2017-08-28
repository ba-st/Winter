accessing
friction: aFloat
	^ self ffiCall:  #( void cpShapeSetFriction(self, cpFloat aFloat) )