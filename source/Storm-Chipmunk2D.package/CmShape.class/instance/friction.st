accessing
friction
	^ self indirectCall: #( cpFloat cpShapeGetFriction(self) )