private
primVelocity
	^ self indirectCall: #( cpVect cpBodyGetVelocity(self) )