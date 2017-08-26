instance creation
newSimpleMotor: aBody with: anotherbody rate: rate
"cpSimpleMotorNew(cpBody *a, cpBody *b, cpFloat rate) "
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpSimpleMotorNew(CmBody aBody, CmBody anotherbody, cpFloat rate))
