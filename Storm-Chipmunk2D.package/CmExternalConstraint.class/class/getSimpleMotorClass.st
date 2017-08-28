static class accessor
getSimpleMotorClass
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraintClass cpSimpleMotorGetClass())
