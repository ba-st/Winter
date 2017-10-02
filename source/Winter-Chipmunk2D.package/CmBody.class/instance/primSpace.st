private
primSpace
	^ self ffiCall:  #( cpSpace * cpBodyGetSpace(self) )
	