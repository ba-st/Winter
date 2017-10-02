instance creation
newDampedRotarySpring: aBody with: anotherbody restAngle:  restAngle stiffness: stiffness damping: damping

<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraint cpDampedRotarySpringNew(CmBody aBody, CmBody anotherbody,  cpFloat restAngle, cpFloat stiffness, cpFloat damping))
