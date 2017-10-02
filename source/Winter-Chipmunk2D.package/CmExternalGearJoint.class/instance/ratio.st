accessing
ratio
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpGearJointGetRatio( self ))