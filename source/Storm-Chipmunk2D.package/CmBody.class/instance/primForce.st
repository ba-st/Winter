private
primForce
	^ self ffiCall:  #( cpVect cpBodyGetForce(self) )
	