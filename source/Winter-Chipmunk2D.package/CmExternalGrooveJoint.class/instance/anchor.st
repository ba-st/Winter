accessing
anchor
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpGrooveJointGetAnchorB( self ))