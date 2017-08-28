accessing
grooveB
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( CmVector _cpGrooveJointGetGrooveB( self ))