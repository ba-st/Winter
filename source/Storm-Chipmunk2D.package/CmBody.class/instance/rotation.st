accessing
rotation
	^ self indirectCall: #( cpVect _cpBodyGetRot(self) )