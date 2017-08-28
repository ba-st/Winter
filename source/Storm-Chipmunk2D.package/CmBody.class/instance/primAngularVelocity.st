private
primAngularVelocity
	^ self ffiCall:  #( cpFloat cpBodyGetAngularVelocity(self) )
