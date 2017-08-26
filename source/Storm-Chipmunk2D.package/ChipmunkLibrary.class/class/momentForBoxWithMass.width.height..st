moments
momentForBoxWithMass: mass width: width height: height
	^ self
		primCpMomentForBoxWithMass: mass asFloat 
		width: width asFloat 
		height: height asFloat