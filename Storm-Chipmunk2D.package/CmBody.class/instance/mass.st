accessing
mass
	^ self indirectCall: #( cpFloat _cpBodyGetMass(self) )