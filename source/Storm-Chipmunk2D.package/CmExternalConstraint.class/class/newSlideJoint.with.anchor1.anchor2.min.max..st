instance creation
newSlideJoint: aBody with: anotherbody anchor1:  anchr1 anchor2: anchr2 min: min max: max
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpSlideJointNew(CmBody aBody, CmBody anotherbody, CmVector anchr1, CmVector anchr2, cpFloat min, cpFloat max))
