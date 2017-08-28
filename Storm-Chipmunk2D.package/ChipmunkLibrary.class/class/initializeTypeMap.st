class initialization
initializeTypeMap
	"self initializeTypeMap"
	TypeMap := Dictionary newFromPairs: #(
		cpBool                    bool
		cpFloat                   float
		cpTimestamp               uint
		cpHashValue               uint
		cpLayers                  uint
		cpGroup                   uint
		cpCollisionType           uint

		cpDataPointer             ulong
		cpShapeClass              ulong
		cpArray                   ulong
		cpSpatialIndex            ulong
		cpContactBufferHeader     ulong
		cpHashSet                 ulong
		cpBodyVelocityFunc        ulong
		cpBodyPositionFunc        ulong
		cpArbiter                 ulong
		cpConstraint              ulong
		
		cpCollisionBeginFunc      CmCollisionBegin
		cpCollisionPreSolveFunc   CmCollisionPreSolve
		cpCollisionPostSolveFunc  CmCollisionPostSolve
		cpCollisionSeparateFunc   CmCollisionSeparate

		cpVect                    CmVector
		cpSpace                   CmSpace
		cpBody                    CmBody
		cpShape                   CmShape
		cpBB                      CmBoundingBox
	)