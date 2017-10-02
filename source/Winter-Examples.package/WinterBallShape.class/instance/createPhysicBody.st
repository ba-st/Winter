private
createPhysicBody 
	 ^CmBody 
		newMass: self mass
		moment: (ChipmunkLibrary 
			momentForCircleWithMass: self mass
			innerRadius: 0.0 
			outerRadius: self radius asFloat 
			offset: 0@0).