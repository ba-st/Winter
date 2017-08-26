accessing
angularVelocity
	^ self indirectCall: #( cpFloat _cpBodyGetAngVel(self) )