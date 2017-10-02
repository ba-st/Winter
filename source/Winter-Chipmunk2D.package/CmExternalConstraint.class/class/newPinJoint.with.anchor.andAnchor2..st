instance creation
newPinJoint: aBody with: anotherbody anchor: anchr1 andAnchor2: anchr2
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

^ self nbCall: #(CmExternalConstraint cpPinJointNew(CmBody aBody, CmBody anotherbody, CmVector anchr1, CmVector anchr2))



