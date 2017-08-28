private
primDamping: aFloat
	^ self ffiCall:  #( void cpSpaceSetDamping(self, cpFloat aFloat) )