private
primCpMomentForPolyWithMass: m numVertices: numVerts vertices: vertices offset: offset
	^ self ffiCall: #( cpFloat cpMomentForPoly(
			cpFloat m,
			int numVerts,
			cpVect *verts,
			cpVect offset) )