accessing
torque: aFloat
	^ self indirectCall: #( void _cpBodyGetTorque(self, cpFloat aFloat) )
