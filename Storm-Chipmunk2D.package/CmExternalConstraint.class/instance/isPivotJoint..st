Testing
isPivotJoint: aConstraint
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( cpBool cpConstraintIsPivotJoint(*aConstraint))
