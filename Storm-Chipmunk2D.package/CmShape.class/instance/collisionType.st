accessing
collisionType
	^ self ffiCall: #( cpCollisionType cpShapeGetCollisionType(self) )	