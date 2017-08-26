private
primAngle
	^ self	ffiCall: #( cpFloat cpBodyGetAngle ( self) )