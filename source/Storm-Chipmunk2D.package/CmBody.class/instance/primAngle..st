private
primAngle: aFloat
	^ self	ffiCall: #( void cpBodySetAngle ( self, cpFloat aFloat ) )