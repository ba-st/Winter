private
primGravity
	^ self indirectCall: #( cpFloat cpSpaceGetGravity(self) )