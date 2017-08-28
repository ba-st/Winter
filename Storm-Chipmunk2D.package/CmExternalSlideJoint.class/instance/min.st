accessing
min
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpSlideJointGetMin( self ))