instance creation
newRotaryLimitJoint: aBody with: anotherbody min:  min max: max 

<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpRotaryLimitJointNew(CmBody aBody, CmBody anotherbody,  cpFloat min, cpFloat max))
