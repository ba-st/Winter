private
primPosition

	^ self ffiCall:  #( cpVect cpBodyGetPosition(self) )