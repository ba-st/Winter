private
primAngularVelocity
	^ self indirectCall: #( cpFloat cpBodyGetAngularVelocity(self) )
