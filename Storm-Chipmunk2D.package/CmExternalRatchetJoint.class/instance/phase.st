accessing
phase
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpRatchetJointGetPhase( self ))