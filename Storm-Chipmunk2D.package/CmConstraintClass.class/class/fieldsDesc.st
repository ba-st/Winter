fields description
fieldsDesc
	"self rebuildFieldAccessors "
	^#(
		CmConstraintPreStepImpl preStep;
		CmConstraintApplyCachedImpulseImpl applyCachedImpulse;
		CmConstraintApplyImpulseImpl applyImpulse;
		CmConstraintGetImpulseImpl getImpulse;
	)