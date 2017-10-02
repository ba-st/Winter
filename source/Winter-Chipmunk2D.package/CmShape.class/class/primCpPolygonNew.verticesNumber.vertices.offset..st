private
primCpPolygonNew: body verticesNumber: numVertices vertices: vertices offset: offset

	^ self ffiCall: #( cpShape* cpPolyShapeNew(
			cpBody *body,
			int numVertices,
			void *vertices,
			cpVect offset ) )