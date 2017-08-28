accessing
staticBody
	^ self ffiCall:  #( cpBody* cpSpaceGetStaticBody(self) )	