private
primForce: aVector
	^ self ffiCall:  #( void cpBodySetForce(self, cpVect aVector) )
	