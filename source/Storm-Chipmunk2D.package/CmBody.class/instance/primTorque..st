private
primTorque: aFloat
	^ self ffiCall:  #( void cpBodySetTorque(self, cpFloat aFloat) )