accessing
anchr1
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpDampedSpringGetAnchorA( self ))