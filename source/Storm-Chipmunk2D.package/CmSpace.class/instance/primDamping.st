private
primDamping
	^ self indirectCall: #( cpFloat cpSpaceGetDamping(self) )