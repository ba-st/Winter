private
primCenterOfGravity
	^ self ffiCall: #( cpVect cpBodyGetCenterOfGravity ( self) )
