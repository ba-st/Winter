private
primType
	^ self ffiCall: #( cpBodyType cpBodyGetType(self) )