private
createPhysicShape
	^(CmShape 
			newPolygonBody: self scene physicSpace staticBody 
			vertices: vertices
			offset: position)
		friction: 1.0;
		collisionType: self class defaultCollisionType;
		yourself