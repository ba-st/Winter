accessing
max
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRotaryLimitJointGetMax( self ))