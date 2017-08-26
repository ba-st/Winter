accessing
collisionType: anInteger
	^ self indirectCall: #( void cpShapeSetCollisionType(self, cpCollisionType anInteger) )	