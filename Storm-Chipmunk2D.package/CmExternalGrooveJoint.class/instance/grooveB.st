accessing
grooveB
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpGrooveJointGetGrooveB( self ))