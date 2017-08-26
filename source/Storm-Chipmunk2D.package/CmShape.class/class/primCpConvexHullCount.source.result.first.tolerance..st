private
primCpConvexHullCount: count source: verts result: result first: first tolerance: tol
	^ self ffiCall: #( int cpConvexHull(
			int count,
			cpVect *verts,
			cpVect *result,
			int *first,
			cpFloat tol ) )	
			