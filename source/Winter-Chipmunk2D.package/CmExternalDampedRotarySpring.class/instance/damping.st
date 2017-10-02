accessing
damping
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat _cpDampedRotarySpringGetDamping( self ))