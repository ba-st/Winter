instance creation
newGearJoint: aBody with: anotherbody phase:  phase ratio: ratio 

<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpGearJointNew(CmBody aBody, CmBody anotherbody, cpFloat phase, cpFloat ratio))
