private
primDamping: aFloat
	^ self indirectCall: #( void cpSpaceSetDamping(self, cpFloat aFloat) )