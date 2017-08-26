querying
nearestShapeFrom: aPoint maxDistance: maxDistance
	
	^ self
		primNearestShapeFrom: aPoint asCmVector
		maxDistance: maxDistance asFloat
		layers: nil group: nil info: nil