accessing
grooveA
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( CmVector _cpGrooveJointGetGrooveA( self ))