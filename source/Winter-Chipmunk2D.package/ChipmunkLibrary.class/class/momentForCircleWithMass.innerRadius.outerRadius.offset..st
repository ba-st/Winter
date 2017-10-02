moments
momentForCircleWithMass: mass innerRadius: r1 outerRadius: r2 offset: offset
	^ self
		primCpMomentForCircleWithMass: mass asFloat 
		innerRadius: r1 asFloat 
		outerRadius: r2 asFloat 
		offset: offset asCmVector