private
primMoment: aFloat
	^ self ffiCall: #( void cpBodySetMoment ( self, cpFloat aFloat ) )