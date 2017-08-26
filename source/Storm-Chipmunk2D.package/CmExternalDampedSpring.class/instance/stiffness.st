accessing
stiffness
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpDampedSpringGetStiffness( self ))