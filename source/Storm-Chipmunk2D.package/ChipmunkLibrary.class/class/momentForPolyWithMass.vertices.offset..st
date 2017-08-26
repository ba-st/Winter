private
momentForPolyWithMass: mass vertices: vertices offset: offset
	^ self
		primCpMomentForPolyWithMass: mass asFloat
		numVertices: vertices size
		vertices: (vertices asExternalArrayOfType: CmVector)
		offset: offset asCmVector