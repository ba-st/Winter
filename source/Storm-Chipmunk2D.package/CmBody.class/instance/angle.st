accessing
angle
	^ self indirectCall: #( cpFloat _cpBodyGetAngle(self) )