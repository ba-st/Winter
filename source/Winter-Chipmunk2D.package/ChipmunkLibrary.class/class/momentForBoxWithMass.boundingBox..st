moments
momentForBoxWithMass: mass boundingBox: bb
	^ self
		primCpMomentForBox2WithMass: mass asFloat 
		boundingBox: bb asCmBoundingBox