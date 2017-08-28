Testing
isPinJoint: aConstraint
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( cpBool cpConstraintIsPinJoint(*aConstraint))
