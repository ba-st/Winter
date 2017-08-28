Testing
isGrooveJoint: aConstraint
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( cpBool cpConstraintIsGrooveJoint(*aConstraint))
