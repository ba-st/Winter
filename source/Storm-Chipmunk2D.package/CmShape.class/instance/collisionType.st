accessing
collisionType
	^ self indirectCall: #( cpCollisionType cpShapeGetCollisionType(self) )	