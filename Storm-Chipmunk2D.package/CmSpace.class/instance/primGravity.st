private
primGravity
	^ self ffiCall:  #( cpFloat cpSpaceGetGravity(self) )