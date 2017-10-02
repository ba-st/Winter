instance creation
newMass: mass moment: moment
	^ (self
			primCpBodyNewMass: mass asFloat
			moment: moment asFloat)
		initialize