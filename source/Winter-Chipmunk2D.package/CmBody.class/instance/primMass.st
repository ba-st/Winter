private
primMass
	^ self ffiCall: #( cpFloat cpBodyGetMass ( self) )