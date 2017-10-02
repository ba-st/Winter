private
primVelocity
	^ self ffiCall:  #( cpVect cpBodyGetVelocity(self) )