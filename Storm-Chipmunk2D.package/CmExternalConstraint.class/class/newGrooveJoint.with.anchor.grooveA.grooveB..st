instance creation
newGrooveJoint: aBody with: anotherbody anchor:  anchr1 grooveA: aVector grooveB: anotherVector
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpGrooveJointNew(CmBody aBody, CmBody anotherbody, CmVector aVector, CmVector anotherVector, CmVector anchr1))
