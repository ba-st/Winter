accessing
restAngle
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpDampedRotarySpringGetRestAngle( self ))