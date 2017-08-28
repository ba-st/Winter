as yet unclassified
specialize
	| constraintMaterialize |
	constraintMaterialize := self constraint.
self flag: 'Ver esto'.	
	" this seems ugly or easily replacable by a double dispatch but the C library of Chipmunk using cast for create specialized pointer to constraint. 
	So in some context we can determine the type (ex newSimpleMotor will return a simpleMotor) but not in all the case, so we need to cast in some case ). "
	
	( self isDampedRotarySpring: constraintMaterialize ) ifTrue:[^CmExternalDampedRotarySpring newFor: self ].
	(self isDampedSpring: constraintMaterialize ) ifTrue:[^CmExternalDampedSpring newFor: self ].
	(self isGearJoint: constraintMaterialize) ifTrue:[^CmExternalGearJoint newFor: self ].
	(self isGrooveJoint: constraintMaterialize) ifTrue:[^CmExternalGrooveJoint newFor: self ].
	(self isPinJoint: constraintMaterialize) ifTrue:[^CmExternalPinJoint newFor: self ].
	(self isPinJoint: constraintMaterialize) ifTrue:[^CmExternalPivotJoint newFor: self ].
	(self isRatchetJoint: constraintMaterialize) ifTrue:[^CmExternalRatchetJoint newFor: self ].
	(self isRotaryLimitJoint: constraintMaterialize) ifTrue:[^CmExternalRotaryLimitJoint newFor: self ].
	(self isSimpleMotor: constraintMaterialize) ifTrue:[^CmExternalSimpleMotor newFor: self ].
	(self isSlideJoint: constraintMaterialize) ifTrue:[^CmExternalSlideJoint newFor: self ].
	