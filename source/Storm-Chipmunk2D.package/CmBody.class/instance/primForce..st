private
primForce: aVector
	^ self indirectCall: #( void cpBodySetForce(self, cpVect aVector) )
	