accessing
restAngle
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedRotarySpringGetRestAngle( self ))