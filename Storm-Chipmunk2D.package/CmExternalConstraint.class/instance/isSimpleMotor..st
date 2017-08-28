Testing
isSimpleMotor: aConstraint
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( cpBool cpConstraintIsSimpleMotor(*aConstraint))
