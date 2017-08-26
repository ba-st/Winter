private
primNearestShapeFrom: aVector maxDistance: aFloat layers: layersFilter group: aGroup info: aNearestPointInfo
	^ self ffiCall: #( cpShape* cpSpacePointQueryNearest(
			cpSpace self,
			cpVect aVector,
			cpFloat aFloat,
			cpLayers layersFilter,
			cpGroup aGroup,
			cpNearestPointQueryInfo *aNearestPointInfo
		) )