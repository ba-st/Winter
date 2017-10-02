private
createPhysicBody 
	 ^CmBody 
		newMass: 1.0
		moment: (ChipmunkLibrary 
			momentForBoxWithMass: 1.0
			width: self extent x
			height: self extent y).