instance creation
newPivotJoint: aBody with: anotherbody joinedTo: aVect
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpPivotJointNew(CmBody  aBody, CmBody anotherbody, CmVector aVect))
