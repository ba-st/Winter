accessing
torque
	^ self indirectCall: #( cpFloat _cpBodyGetTorque(self) )
	