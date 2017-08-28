accessing
moment
	^ self indirectCall: #( cpFloat _cpBodyGetMoment(self) )
	