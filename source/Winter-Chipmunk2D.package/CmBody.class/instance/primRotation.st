private
primRotation
	^ self ffiCall: #( cpVect cpBodyGetRotation( self) )