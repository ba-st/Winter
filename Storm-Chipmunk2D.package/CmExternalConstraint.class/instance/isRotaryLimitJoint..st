Testing
isRotaryLimitJoint: aConstraint
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( cpBool cpConstraintIsRotaryLimitJoint(*aConstraint))
