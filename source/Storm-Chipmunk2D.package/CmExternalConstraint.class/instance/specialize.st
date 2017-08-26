as yet unclassified
specialize
	| myKlass constraintMaterialize |
	constraintMaterialize := self constraint.
	
	" this seems ugly or easily replacable by a double dispatch but the C library of Chipmunk using cast for create specialized pointer to constraint. 
	So in some context we can determine the type (ex newSimpleMotor will return a simpleMotor) but not in all the case, so we need to cast in some case ). "
	
	(constraintMaterialize klass = CmExternalConstraint getDampedRotarySpringClass ) ifTrue:[^CmExternalDampedRotarySpring newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getDampedSpringClass ) ifTrue:[^CmExternalDampedSpring newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getGearJointClass) ifTrue:[^CmExternalGearJoint newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getGrooveJointClass) ifTrue:[^CmExternalGrooveJoint newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getPinJointClass) ifTrue:[^CmExternalPinJoint newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getPivotJointClass) ifTrue:[^CmExternalPivotJoint newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getRatchetJointClass) ifTrue:[^CmExternalRatchetJoint newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getRotaryLimitJointClass ) ifTrue:[^CmExternalRotaryLimitJoint newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getSimpleMotorClass  ) ifTrue:[^CmExternalSimpleMotor newFor: self ].
	(constraintMaterialize klass = CmExternalConstraint getSlideJointClass) ifTrue:[^CmExternalSlideJoint newFor: self ].
	