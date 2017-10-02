accessing
stiffness
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedSpringGetStiffness( self ))