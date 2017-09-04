private
primRotation: aVector
	^ self ffiCall: #( void cpBodySetRotation ( self, cpVect aVector) )