private
primVelocity: vector
	^ self ffiCall: #( void cpBodySetVelocity ( self, cpVect vector ) )
