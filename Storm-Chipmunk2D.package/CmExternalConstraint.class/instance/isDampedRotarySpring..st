Testing
isDampedRotarySpring: aConstraint
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( cpBool cpConstraintIsDampedRotarySpring(*aConstraint))
