private
primCenterOfGravity: aVector
	^ self ffiCall: #( void cpBodySetCenterOfGravity ( self, cpVect aVector) )
