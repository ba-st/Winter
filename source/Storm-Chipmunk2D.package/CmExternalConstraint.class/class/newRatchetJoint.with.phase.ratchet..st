instance creation
newRatchetJoint: aBody with: anotherbody phase:  phase ratchet: ratchet 

<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpRatchetJointNew(CmBody aBody, CmBody anotherbody,  cpFloat phase, cpFloat ratchet))
