instance creation
newPolygonBody: aBody vertices: hullVertices offset: offsetPoint
	"Creates a polygon shape from an array of vertices defining its clockwise convex hull and the offset from the center of gravity."
	| vertices |
	
	vertices := FFIExternalArray
		externalNewType: CmVector
		size: hullVertices size.
	hullVertices withIndexDo: [ :each :index | |v|
		v := each asCmVector.
		(vertices at: index)
			x: v x;
			y: v y.
		"vertices at: index put: v" ].
	
	^ (self
			primCpPolygonNew: aBody
			verticesNumber: vertices size
			vertices: vertices getHandle
			offset: offsetPoint asCmVector)
		initialize