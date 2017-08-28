accessing
damping
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpDampedSpringGetDamping( self ))