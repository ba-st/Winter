accessing
phase
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRatchetJointGetPhase( self ))