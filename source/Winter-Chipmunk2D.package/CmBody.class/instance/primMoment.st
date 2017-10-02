private
primMoment
	^ self ffiCall: #( void cpBodyGetMoment ( self) )