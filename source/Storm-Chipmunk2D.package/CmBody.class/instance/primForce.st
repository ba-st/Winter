private
primForce
	^ self indirectCall: #( cpVect cpBodyGetForce(self) )
	