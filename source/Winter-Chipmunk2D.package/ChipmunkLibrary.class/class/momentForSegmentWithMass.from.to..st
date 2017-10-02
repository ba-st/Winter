moments
momentForSegmentWithMass: mass from: from to: to
	^ self
		primCpMomentForSegmentWithMass: mass asFloat 
		from: from asCmVector 
		to: to asCmVector