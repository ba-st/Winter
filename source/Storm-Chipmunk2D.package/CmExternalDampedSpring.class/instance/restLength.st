accessing
restLength
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedSpringGetRestLength( self ))