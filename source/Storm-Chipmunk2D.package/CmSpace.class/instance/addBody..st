accessing
addBody: body
	
	^ self ffiCall: #( void cpSpaceAddBody(self, cpBody body) )