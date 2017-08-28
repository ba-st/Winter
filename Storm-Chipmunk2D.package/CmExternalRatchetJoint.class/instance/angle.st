accessing
angle
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpRatchetJointGetAngle( self ))