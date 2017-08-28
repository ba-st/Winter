private
primDamping
	^ self ffiCall:  #( cpFloat cpSpaceGetDamping(self) )