instance creation
newDampedSpring: aBody with: anotherbody anchor1:  anchr1 anchor2:  anchr2 restLength: aFloat stiffness: stiffness damping: damping
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpDampedSpringNew(CmBody aBody, CmBody anotherbody, CmVector anchr1, CmVector anchr2, cpFloat restLength, cpFloat stiffness, cpFloat damping))
