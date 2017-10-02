instance creation
newInfinite
	"Used for static bodies"
	^ self
		newMass: Float infinity
		moment: Float infinity