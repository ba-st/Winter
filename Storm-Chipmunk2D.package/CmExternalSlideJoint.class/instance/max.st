accessing
max
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self indirectCall: #( cpFloat _cpSlideJointGetMax( self ))