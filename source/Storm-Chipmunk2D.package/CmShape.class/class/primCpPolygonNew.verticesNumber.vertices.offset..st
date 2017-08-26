private
primCpPolygonNew: body verticesNumber: numVertices vertices: vertices offset: offset
self flag: 'Arreglar'.
	^ self ffiCall: #( cpShape* cpPolyShapeNew(
			cpBody *body,
			int numVertices,
			void *vertices,
			cpVect offset ) )