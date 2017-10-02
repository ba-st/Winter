private
primTorque
	^ self ffiCall:  #( cpFloat cpBodyGetTorque(self) )