accessing
friction: aFloat
	^ self indirectCall: #( void cpShapeSetFriction(self, cpFloat aFloat) )