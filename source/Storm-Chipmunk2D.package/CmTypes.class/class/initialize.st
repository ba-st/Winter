pool initialization
initialize
	"self initialize"
	
	cpBool := #bool.
	cpFloat := #float.
	cpTimestamp := #uint.
	cpHashValue := #uint.
	cpLayers := #uint.
	cpGroup := #uint.
	cpCollisionType := #uint.
		
	"Translating to pointer"
	cpDataPointer := #ulong.
	cpShapeClass := #ulong.
	cpArray := #ulong.
	cpSpatialIndex := #ulong.
	cpContactBufferHeader := #ulong.
	cpHashSet := #ulong.
	cpBodyVelocityFunc := #ulong.
	cpBodyPositionFunc := #ulong.
	cpArbiter := #ulong.
	cpConstraint := #ulong.
	
	"Translating to inner classes"
	cpVect := #CmVector.
	cpSpace := #CmSpace.
	cpBody := #CmBody.
	cpShape := #CmShape.
	cpBB := #CmBoundingBox.