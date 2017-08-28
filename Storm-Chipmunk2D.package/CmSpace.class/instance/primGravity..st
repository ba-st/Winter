private
primGravity: aVector
	^ self ffiCall: #(void cpSpaceSetGravity (self , cpVect aVector))