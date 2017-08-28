private
primCpPolygonNew: body verticesNumber: numVertices vertices: vertices radius: radius
self flag: 'Ver si esta bien usar la funcion raw'.
	^ self ffiCall: #( cpShape* cpPolyShapeNewRaw(
			cpBody *body,
			int numVertices,
			void *vertices,
			cpVect radius ) )