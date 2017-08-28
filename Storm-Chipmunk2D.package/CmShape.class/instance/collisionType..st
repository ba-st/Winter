accessing
collisionType: anInteger
	^ self ffiCall: #( void cpShapeSetCollisionType(self, cpCollisionType anInteger) )	