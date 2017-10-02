private
primMass: aFloat
	^ self ffiCall: #( void cpBodySetMass ( self, cpFloat aFloat ) )